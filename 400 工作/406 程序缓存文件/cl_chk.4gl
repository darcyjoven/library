#該程式未解開Section, 採用最新樣板產出!
#該程式為freestyle程式!
{<section id="cl_chk.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0030(1900-01-01 00:00:00), PR版次:0030(1900-01-01 00:00:00)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000351
#+ Filename...: cl_chk
#+ Description: 檢核功能
#+ Creator....: 01258(2013-08-16 09:54:32)
#+ Modifier...: 00000 -SD/PR- 00000
 
{</section>}
 
{<section id="cl_chk.global" type="s" >}
#應用 p00 樣板自動產生(Version:6)
#add-point:填寫註解說明 name="main.memo"
#+ Modifier...: No.160808-00003 #1   2016/12/10   by jrg542       日期欄位沒有卡控
#+ Modifier...: No.170123-00018 #1   2017/01/23   by jrg542       修正 cl_chk_update_docdt() 及 cl_chk_update_pstdt() 這兩個function
#+ Modifier...: No.170525-00010 #2   2017/05/25   by frank0521    修改COUNT(*) 改成 COUNT(1)
#+ Modifier...: No.170613-00046 #1   2017/06/28   by jrg542       進銷存單據日期的角色管控方式的，應該呼叫cl_auth_chk_pstdt()
#+ Modifier...: No.170721-00008 #1   2017/07/21   by frank0521    增加 檢核 mail格式
#+ Modifier...: No.180312-00040 #1   2018/04/26   by 08146        增加 mongodb 測試連線 function
#+ Modifier...: No.180424-00011 #1    2018/04/27  by 01856         綁定 180424-00011 相關程式
#+ Modifier...: No:181128-00048 #1   2019/03/13   by 00824        新增判斷是否為1.0與3.0混用的環境
#+ Modifier...: No:190408-00027 #1   2019/04/09   by 00824        判斷輸入的字串中是否有包含特殊字
#+ Modifier...: No:190725-00001 #1   2019/07/25   by 05292        cl_chk_update_docdt() 確認本單據的docdt欄位是否可以被修改function，增加檢核是否為財務模組，如為財務模組則跳出不檢核。
#+ Modifier...: No:200203-00002 #1   2020/02/03   by 01856        修改cl_chk_is_date  SELECT TO_DATE(lc_str,'yyyy/mm/dd') INTO ps_date FROM dual 改成 DATE(lc_str)
#+ Modifier...: No:200402-00001 #1   2020/04/08   by 04013        放開行業程式命名規則，允許客製環境新建行業程式
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
 
{<section id="cl_chk.free_style_variable" type="s" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"

#end add-point
 
{</section>}
 
{<section id="cl_chk.global_variable" type="s" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"

#end add-point
 
{</section>}
 
{<section id="cl_chk.other_dialog" type="s" >}

 
{</section>}
 
{<section id="cl_chk.other_function" readonly="Y" type="s" >}

PUBLIC FUNCTION cl_chk_program_executed(ps_gzza001)
   DEFINE ps_gzza001  LIKE gzza_t.gzza001
   DEFINE lc_gzzx008  LIKE gzzx_t.gzzx008
   DEFINE li_return   LIKE type_t.num5

   SELECT gzzx008 INTO lc_gzzx008 FROM gzzx_t
    WHERE gzzx001 = ps_gzza001
   IF SQLCA.SQLCODE THEN
      LET lc_gzzx008 = "N"
   END IF

   IF lc_gzzx008 IS NULL OR lc_gzzx008 = " " OR lc_gzzx008 <> "Y" THEN
      LET li_return = FALSE
   ELSE
      LET li_return = TRUE
   END IF

   RETURN li_return
END FUNCTION
############################################################
#+ @code
#+ 函式目的   取得相關語言別
#+ @param    pi_lang  NUMBER(5) 語言別     
#+
#+ @return   array    語言別(0、1、2)         
############################################################
PRIVATE FUNCTION cl_chk_other_lang(pi_lang)
   DEFINE pi_lang      LIKE type_t.num5   #語言別 
   DEFINE li_cnt       LIKE type_t.num5
   DEFINE ls_sql       STRING   
   DEFINE ld_arr       DYNAMIC ARRAY OF RECORD 
              gzzy001     LIKE gzzy_t.gzzy001,
              lchr_value  LIKE type_t.chr100 
                       END RECORD  
   
   LET ls_sql = "SELECT gzzy001 FROM gzzy_t",
               " WHERE gzzy001 <>", pi_lang CLIPPED
   PREPARE cl_chk_other_pre FROM ls_sql   

   DECLARE cl_chk_other_curs CURSOR FOR cl_chk_other_pre   #指標指向PREPARE
   CALL ld_arr.clear()
   LET li_cnt = 1
   
   FOREACH cl_chk_other_curs INTO ld_arr[li_cnt].gzzy001    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF 
      LET li_cnt = li_cnt + 1
   END FOREACH
   CALL ld_arr.deleteElement(li_cnt)

   CLOSE cl_chk_other_curs
   RETURN ld_arr
END FUNCTION
############################################################
#+ @code
#+ 函式目的  檢核程式類別規則
#+ @param   ps_progtype  CHAR(10)   程式類別變數
#+ @return  SMALLINT   TRUE/FALSE 
############################################################
PUBLIC FUNCTION cl_chk_progtype(ps_progtype)
   DEFINE ps_progtype LIKE gzcb_t.gzcb002
   DEFINE li_cnt      LIKE type_t.num5
   DEFINE li_status   LIKE type_t.num5

   SELECT COUNT(1) INTO li_cnt FROM gzcb_t         #170525-00010#2
    WHERE gzcb001 = '99' AND gzcb002= ps_progtype

   IF li_cnt > 0 THEN
      LET li_status = FALSE
   ELSE
      LET li_status = TRUE
   END IF
   RETURN li_status
END FUNCTION
############################################################
#+ @code
#+ 函式目的  檢查規格名稱歸屬類型
#+ @param    ls_specid  STRING  規格名稱
#+
#+ @return   CHAR(1)  M:主程式  B:應用元件  S:子程式  L:library F:子畫面 N:Null
#+                    W:Web service Middleware
############################################################
PUBLIC FUNCTION cl_chk_spec_type(ls_specid)
   DEFINE ls_specid   STRING
   DEFINE ls_spectype LIKE type_t.chr1
   DEFINE lc_gzde001  LIKE gzde_t.gzde001
   DEFINE lc_gzde003  LIKE gzde_t.gzde003
   DEFINE li_cnt      LIKE type_t.num5
   DEFINE ls_tmp      STRING
   DEFINE lc_dzca001  LIKE dzca_t.dzca001 #20150701
   DEFINE lc_gzdf002  LIKE gzdf_t.gzdf002 
   
   #確認傳入是否為子畫面
   #IF ls_specid.subString(ls_specid.getLength()-3,ls_specid.getLength()-2) = "_s" THEN
   #   #注意最後兩碼一定是數字
   #   LET ls_tmp = ls_specid.subString(ls_specid.getLength()-1,ls_specid.getLength())
   #   IF cl_chk_num(ls_tmp,"N") THEN
   #      #子畫面
   #      LET ls_spectype = "F"
   #      RETURN ls_spectype
   #   END IF
   #END IF
   
   #2016/06/07 調整子畫面判斷方式
   LET lc_gzdf002 = ls_specid
   SELECT COUNT(1) INTO li_cnt        #170525-00010#2
     FROM gzdf_t
    WHERE gzdf002 = lc_gzdf002
   IF li_cnt > 0 THEN
      LET ls_spectype = "F"
      RETURN ls_spectype
   END IF

   LET lc_gzde001 = ls_specid

   #確認傳入是否為子程式,或應用元件
   SELECT COUNT(1) INTO li_cnt        #170525-00010#2
     FROM gzde_t
    WHERE gzde001 = lc_gzde001
   CASE
      WHEN li_cnt = 1
         #子程式/應用元件/LIB
         SELECT gzde003 INTO lc_gzde003 FROM gzde_t
          WHERE gzde001 = lc_gzde001
         RETURN lc_gzde003

      WHEN li_cnt > 1
         CASE
            WHEN ls_specid.subString(1,2) = "s_"
               LET ls_spectype = "S"
            WHEN ls_specid.subString(1,3) = "cl_"
               LET ls_spectype = "L"
            OTHERWISE
               LET ls_spectype = "B"  #應用元件
         END CASE
   END CASE

   #確認傳入是否為web service
   IF ls_specid.subString(1,3) = "wss" OR ls_specid.subString(1,4) = "cwss"  THEN
      LET lc_gzde001 = ls_specid
      SELECT gzja001 INTO lc_gzde003 FROM gzja_t
       WHERE gzja001 = lc_gzde001
      IF NOT SQLCA.SQLCODE THEN
         LET ls_spectype = "W"
         RETURN ls_spectype
      END IF
   END IF

   #20150701 -Begin-
   #確認傳入是否為開窗
   IF ls_specid MATCHES "q_*" OR ls_specid MATCHES "cq_*"  THEN
      LET li_cnt =0
      LET lc_dzca001 = ls_specid
      SELECT COUNT(1) INTO li_cnt FROM dzca_t
         WHERE dzca001=lc_dzca001
      IF li_cnt >0 THEN
         LET ls_spectype = "Q"
         RETURN ls_spectype
      END IF
   END IF
   #20150701 -End-
   
   #最後查看是否為主程式
   SELECT COUNT(1) INTO li_cnt    #170525-00010#2
     FROM gzza_t
    WHERE gzza001 = lc_gzde001
   IF li_cnt > 0 THEN
      LET ls_spectype = "M"   #主程式
   ELSE
      LET ls_spectype = "N"
   END IF
   RETURN ls_spectype

END FUNCTION
############################################################
#+ @code
#+ 函式目的  檢查文字型態變數是否為年月型態
#+ @param    p_str  CHAR(6)  文字型態變數
#+
#+ @return   BOOLEAN  TRUE/FALSE
############################################################
PUBLIC FUNCTION cl_chk_ym(p_str)
   DEFINE p_str  LIKE type_t.chr6
   DEFINE yy     LIKE type_t.chr4
   DEFINE mm     LIKE type_t.chr2
 
   WHENEVER ERROR CALL cl_err_msg_log
 
   LET yy = p_str[1,4]
   LET mm = p_str[5,6]
 
   IF yy < '00' OR yy > '9999'
      THEN RETURN 0
   END IF
   IF mm < '01' OR mm > '12'
      THEN RETURN 0
   END IF
   RETURN 1
END FUNCTION
############################################################
#+ @code
#+ 函式目的  檢查 'p_str' 是否為數值型態
#+ @param    p_str  CHAR(50)   欲檢查的值
#+ @param    ps_type  STRING 檢查型態 (N/U/L/_)
#+
#+ @return   BOOLEAN  TRUE/FALSE
############################################################
PUBLIC FUNCTION cl_chk_num(ls_tmp,ls_type)
   DEFINE ls_type   STRING
   DEFINE li_pos    LIKE type_t.num5
   DEFINE li_stus   LIKE type_t.num5
   DEFINE ls_target STRING
   DEFINE ls_tmp    STRING
   DEFINE ls_chr    LIKE type_t.chr1   #170510-00060
   DEFINE ls_str    STRING             #170510-00060

   WHENEVER ERROR CALL cl_err_msg_log

   IF ls_tmp.getLength() = 0 THEN
      RETURN FALSE
   END IF

   LET li_stus = TRUE
   LET ls_target = ""
   LET ls_type = ls_type.toUppercase()
   FOR li_pos = 1 TO ls_type.getLength()
      CASE ls_type.subString(li_pos,li_pos)
         WHEN "N" LET ls_target = ls_target,"01-9"     #Numeric
         WHEN "U" LET ls_target = ls_target,"A-Z"      #Uppercase
         WHEN "L" LET ls_target = ls_target,"a-z"      #Lowercase
      #   WHEN "_" LET ls_target = ls_target,"_"        #Under-line
         #170510-00060 若是輸入其他符號也應該視為是純英數的判斷，因為非中文或是其他語言的資料
         WHEN "_" LET ls_target = ls_target,"~!@#$%^&*()+=_,./`:;\"'"
      END CASE
   END FOR

   LET ls_target = "[",ls_target.trim(),"]"
   
   #因為一個中文字可能是三個以上字元，所以若是一個字元一個字元擷取時，取出來的字元會是空白，
   #為了避免後續無法判斷該空白字元是使用者原本就輸入的空白字元，或者是因為中文字而擷取出來的字元，
   #因此就先把原字串中的空白字元先replace掉，以利後續判斷
   LET ls_str = cl_replace_str(ls_tmp," ","")

   FOR li_pos = 1 TO ls_tmp.getLength()
      #170510-00060 ---modify start---
   #  IF ls_tmp.subString(li_pos, li_pos) NOT MATCHES ls_target THEN 
   #     LET li_stus = FALSE
   #     EXIT FOR
   
      IF ls_str.subString(li_pos, li_pos) NOT MATCHES ls_target THEN   
         LET li_stus = TRUE
         LET ls_chr = ls_tmp.subString(li_pos,li_pos)
         
         #有些特殊符號無法寫在ls_target裡，否則會造成判斷錯誤，因此改移到這邊個別判斷
         CASE
            WHEN ls_chr = "-"
               LET li_stus = TRUE
            WHEN ls_chr = "["
               LET li_stus = TRUE
            WHEN ls_chr = "]"
               LET li_stus = TRUE
            OTHERWISE
               LET li_stus = FALSE
               EXIT FOR
         END CASE
      END IF
      #170510-00060 --- modify end ---
   END FOR

   RETURN li_stus
END FUNCTION
############################################################
#+ @code
#+ 函式目的 檢核輸入日期前面是否查詢符號 
#+ @param   ps_result  
#+
#+ @return  NUMBER(5)  TURE/FALSE
############################################################
PUBLIC FUNCTION cl_chk_date_symbol(ps_result)
   DEFINE ps_result STRING
   DEFINE li_status LIKE type_t.num5

   IF ps_result.getIndexOf("=",1) OR ps_result.getIndexOf("<",1) OR
      ps_result.getIndexOf(">",1) OR ps_result.getIndexOf("|",1) OR
      ps_result.getIndexOf(":",1) THEN

      LET li_status = TRUE
   ELSE
      LET li_status = FALSE
   END IF
   RETURN li_status
END FUNCTION

PUBLIC FUNCTION cl_chk_app_executed(ps_gzzz001)
   DEFINE ps_gzzz001  LIKE gzzz_t.gzzz001
   DEFINE lc_gzzz002  LIKE gzzz_t.gzzz002
   DEFINE li_return   LIKE type_t.num5

   SELECT gzzz002 INTO lc_gzzz002 FROM gzzz_t
    WHERE gzzz001 = ps_gzzz001

   LET li_return = cl_chk_program_executed(lc_gzzz002)
   RETURN li_return

END FUNCTION
############################################################
#+ @code
#+ 函式目的  檢核行業是否存在
#+ @param   ps_industry  CHAR(80)   行業別變數
#+ @return  SMALLINT   TRUE/FALSE 
############################################################
PUBLIC FUNCTION cl_chk_industry(ps_industry)
   DEFINE ps_industry LIKE gzoi_t.gzoi001
   DEFINE li_cnt      LIKE type_t.num5
   DEFINE li_status   LIKE type_t.num5
   
   SELECT COUNT(1) INTO li_cnt FROM gzoi_t WHERE gzoi001 = ps_industry

   IF li_cnt > 0 THEN
      LET li_status = FALSE
   ELSE
      LET li_status = TRUE
   END IF
   RETURN li_status
END FUNCTION

################################################################################
# Descriptions...: 檢查是否處於行業主機環境
# Memo...........: 先檢查是否為 "s" 標準環境，在查是否在行業區域內
# Usage..........: IF cl_chk_in_industry() THEN
# Return code....: li_return  TRUE在 / FALSE 不在
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_chk_in_industry(lc_industry)
   DEFINE li_return      LIKE type_t.num5
   DEFINE ls_environment STRING
   DEFINE lc_industry    LIKE type_t.chr3

   LET li_return = TRUE
   LET ls_environment = FGL_GETENV("DGENV")
   
   IF ls_environment IS NOT NULL AND ls_environment = "s" THEN
      LET ls_environment = FGL_GETENV("TOPIND")
      IF ls_environment IS NULL OR ls_environment <> lc_industry THEN
         LET li_return = FALSE
      ELSE
         LET li_return = TRUE
      END IF
   ELSE
      #LET li_return = FALSE   #200402-00001  mark
   END IF

   RETURN li_return
END FUNCTION
############################################################
#+ @code
#+ 函式目的  檢核模組規則
#+ @param   ps_module  CHAR(3)  模組變數
#+ @return  SMALLINT   TRUE/FALSE 
############################################################
PUBLIC FUNCTION cl_chk_module(ps_module)
   DEFINE ps_module LIKE type_t.chr20
   DEFINE li_cnt    LIKE type_t.num5
   DEFINE li_status LIKE type_t.num5
   
   SELECT COUNT(1) INTO li_cnt FROM  gzzj_t WHERE gzzj001 = ps_module    #170525-00010#2
   IF li_cnt > 0 THEN
      LET li_status = FALSE
   ELSE
      LET li_status = TRUE
   END IF
   
   RETURN li_status
END FUNCTION
############################################################
#+ @code
#+ 函式目的  檢核ipv4
#+ @param    ps_ip    STRING  ip
#+
#+ @return   BOOLEAN  TRUE/FALSE
############################################################
PUBLIC FUNCTION cl_chk_ipv4(ps_ip)
   DEFINE ps_ip    STRING
   DEFINE ld_array DYNAMIC ARRAY OF STRING 
   DEFINE lst_pk   base.StringTokenizer
   DEFINE li       LIKE type_t.num5 
   
   LET lst_pk = base.StringTokenizer.create(ps_ip CLIPPED, ".")
   LET li = 1
   WHILE lst_pk.hasMoreTokens()
      LET ld_array[li] = lst_pk.nextToken()
      LET li = li + 1
   END WHILE    

   IF ld_array.getLength() <= 3 THEN 
      RETURN FALSE 
   END IF 

   FOR li = 1 TO ld_array.getLength()
        IF (ld_array[li] < 0 || ld_array[li] > 255 ) THEN
           RETURN FALSE
        END IF 
   END FOR 

   RETURN TRUE
END FUNCTION
############################################################
#+ @code
#+ 函式目的   檢查存在：根據其SQL(l_dzcd003)進行檢查存在,若資料不存在則顯示錯誤訊息(l_dzcd004)
#+ 演算方法     
#+ 假設         
#+ 影響         
#+ @param    p_chk_id   CHAR(20)    校驗帶值識別碼
#+
#+ @return   BOOLEAN    FALSE(資料不存在或SQL語句錯誤或使用錯誤的校驗帶值識別碼)/TRUE(資料存在)
############################################################
PUBLIC FUNCTION cl_chk_exist(p_chk_id)
   DEFINE p_chk_id      LIKE dzcd_t.dzcd001      #校驗帶值識別碼
   DEFINE lb_flag       LIKE type_t.num5
   
   CALL cl_chk_validate_chk_exist(p_chk_id) RETURNING lb_flag

   RETURN lb_flag
END FUNCTION
################################################################################
# Descriptions...: 檢查離散資料如(1,3,5,7)是否符合在這個資料內
# Memo...........:
# Usage..........: CALL cl_chk_discrete_data(ps_chk,ps_str)
#                  RETURNING TRUE/FALSE
# Input parameter: ps_chk STRING   
#                : ps_str STRING  
# Return code....: 
#                : 
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_chk_discrete_data(ps_chk,ps_str)
  DEFINE ps_str        STRING 
  DEFINE ps_chk        STRING 
  DEFINE l_token       base.StringTokenizer
  DEFINE li_chk       LIKE type_t.num5
  DEFINE ls_next       STRING
  
  LET l_token = base.StringTokenizer.create(ps_chk, ",")
  LET li_chk = FALSE 
  WHILE l_token.hasMoreTokens()
      LET ls_next = l_token.nextToken()
      LET ls_next = ls_next.trim()
      #假如檢核符合表示在這檢核區間是可以的 
      IF ls_next = ps_str THEN 
         LET li_chk =  TRUE 
         EXIT WHILE 
      END IF 
   END WHILE 
  RETURN li_chk
END FUNCTION
############################################################
#+ @code
#+ 函式目的   檢查存在兼帶值：根據其SQL(l_dzcd003)檢查存在並帶出參照的欄位值,若資料筆數不唯一則顯示錯誤訊息(l_dzcd004)
#+           ,然後帶回預設值存至g_chkgaram.return1 ~ g_chkgaram.return9
#+ 演算方法     
#+ 假設         
#+ 影響         
#+ @param    p_chk_id   CHAR(20)    校驗帶值識別碼
#+
#+ @return   BOOLEAN    FALSE(資料筆數不唯一或SQL語句錯誤或使用錯誤的校驗帶值識別碼)/TRUE(資料筆數唯一且已帶值)
############################################################
PUBLIC FUNCTION cl_chk_exist_and_ref_val(p_chk_id)
   DEFINE p_chk_id      LIKE dzcd_t.dzcd001                  #校驗帶值識別碼
   DEFINE lb_flag       LIKE type_t.num5

   CALL cl_chk_validate_chk_exist_and_ref_val(p_chk_id) RETURNING lb_flag

   RETURN lb_flag
END FUNCTION
##################################################
# Descriptions...: 檢查輸入的資料在unicode下是否屬於繁體或簡體字的範圍
# Input parameter: lc_gzzy001  待查的是繁體字或簡體字
#                  ls_str      待檢查的字串
#                  pi_idle_sec 錯誤訊息IDLE秒數
# Return code....: TRUE/FALSE  合格或不合格
# Usage..........: CALL cl_chk_bgorgb("zh_TW","這裡面不含有簡體字")
##################################################
PUBLIC FUNCTION cl_chk_tworcn(lc_gzzy001,ls_str,pi_idle_sec)
   DEFINE lc_gzzy001   LIKE gzzy_t.gzzy001
   DEFINE lc_gzzy002   LIKE gzzy_t.gzzy002  #語言別名稱
   DEFINE pi_idle_sec  LIKE type_t.num5  #訊息IDLE秒數
   DEFINE ls_str       STRING
   DEFINE ls_cmd       STRING
   DEFINE ls_result    STRING
   DEFINE ls_temp      STRING               #TEMPDIR路徑
   DEFINE ls_msg       STRING               #訊息
   DEFINE l_sql        STRING
   DEFINE l_str_ch     base.Channel
   DEFINE ls_filesrc, ls_filetran,ls_filedif,ls_fileu8 STRING
   DEFINE ld_sp_word   DYNAMIC ARRAY OF LIKE dzzd_t.dzzd002   #特殊字清單   #190408-00027
   DEFINE ls_dzzd002   LIKE dzzd_t.dzzd002   #190408-00027
   DEFINE ls_i         LIKE type_t.num5   #190408-00027
   

   WHENEVER ERROR CALL cl_err_msg_log

   IF ls_str IS NULL THEN
      RETURN TRUE   #傳入值為空的時候,不查
   END IF

   #190408-00027 ---start---
   #若是字串中有特殊字因為會無法比對，所以就直接回傳TRUN
   LET ls_i = 0
   CALL ld_sp_word.clear()
   #取得該語系的特殊字清單
   LET l_sql = "SELECT dzzd002 FROM dzzd_t ",
               " WHERE dzzdstus = 'Y' ",
                 " AND dzzd001 = '",lc_gzzy001,"'"
   PREPARE cl_chk_get_dzzd_pre FROM l_sql
   DECLARE cl_chk_get_dzzd_curs CURSOR FOR cl_chk_get_dzzd_pre
   FOREACH cl_chk_get_dzzd_curs INTO ls_dzzd002
      LET ls_i = ls_i + 1
      LET ld_sp_word[ls_i] = ls_dzzd002
   #  DISPLAY "ld_sp_word[",ls_i USING "<<<","]:",ld_sp_word[ls_i]
   END FOREACH
   
   IF ld_sp_word.getLength() > 0 THEN
      FOR ls_i = 1 TO ld_sp_word.getLength()
         #檢查字串中是否有包含特殊字，若有則不再往下做檢查，直接回傳TRUE 
         IF ls_str.getIndexOf(ld_sp_word[ls_i],1) > 0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = "lib-00455"
            LET g_errparam.extend = ""
            LET g_errparam.popup = FALSE
            LET g_errparam.replace[1] = ld_sp_word[ls_i]
         #  CALL cl_err()

            LET ls_msg = cl_getmsg("lib-00455",g_lang)
            DISPLAY ls_msg
            RETURN TRUE
         END IF
      END FOR
   END IF
   #190408-00027 --- end ---

   LET ls_msg = NULL

   LET l_sql = "SELECT gzzy002 FROM gzzy_t WHERE gzzy001 = ? AND gzzystus = 'Y'"
   PREPARE cl_chk_tworcn_pre FROM l_sql
   EXECUTE cl_chk_tworcn_pre USING lc_gzzy001 INTO lc_gzzy002

   LET ls_msg = ls_str CLIPPED,"|",lc_gzzy002 CLIPPED

   LET ls_temp = os.Path.join(FGL_GETENV("TEMPDIR"),FGL_GETPID())
   LET ls_filesrc = ls_temp,"qc.src"
   LET ls_filetran = ls_temp,"qc.tran"
   LET ls_filedif = ls_temp,"qc.dif"
   LET ls_fileu8 = ls_temp,"qc.u8"

   IF os.Path.delete(ls_filesrc) THEN END IF
   IF os.Path.delete(ls_filetran) THEN END IF
   IF os.Path.delete(ls_filedif) THEN END IF
   IF os.Path.delete(ls_fileu8) THEN END IF

   LET l_str_ch = base.Channel.create()
   CALL l_str_ch.openFile(ls_filesrc, "w")
   CALL l_str_ch.writeLine(ls_str.trim())
   CALL l_str_ch.close()

   CASE
      WHEN lc_gzzy001 = "zh_TW"
         LET ls_cmd = "iconv -f UTF-8 -t BIG5 "
      WHEN lc_gzzy001 = "zh_CN"
         LET ls_cmd = "iconv -f UTF-8 -t GB2312 "
      OTHERWISE
         RETURN TRUE   #傳入值不為簡體或繁體,不查
   END CASE

   LET ls_cmd = ls_cmd,ls_filesrc," > ",ls_filetran," 2>/dev/null"
   RUN ls_cmd
   IF os.Path.size(ls_filetran) = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = "lib-00622"
      LET g_errparam.extend = ""
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = ls_msg
      LET g_errparam.replace[2] = lc_gzzy002
      CALL cl_err()
      RETURN FALSE
   END IF
   CASE
      WHEN lc_gzzy001 = "zh_TW"
         LET ls_cmd = "iconv -f BIG5 -t UTF-8 "
      WHEN lc_gzzy001 = "zh_CN"
         LET ls_cmd = "iconv -f GB2312 -t UTF-8 "
   END CASE
   LET ls_cmd = ls_cmd,ls_filetran," > ",ls_fileu8," 2>/dev/null"
   RUN ls_cmd
   LET ls_cmd = "diff ",ls_filesrc," ",ls_fileu8," > ",ls_filedif
   RUN ls_cmd
   IF os.Path.size(ls_filedif) > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = "lib-00622"
      LET g_errparam.extend = ""
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = ls_msg
      LET g_errparam.replace[2] = lc_gzzy002
      CALL cl_err()
      RETURN FALSE
   END IF

   RETURN TRUE

END FUNCTION
################################################################################
# Descriptions...: 檢查session是否存在
# Memo...........:
# Usage..........: cl_chk_process_exists(ls_session,ls_account)
#                  RETURNING li_stus
# Input parameter: ls_session     session代號
#                : ls_account     使用者編號
# Return code....: li_stus        session是否存在 (TRUE / FALSE)
# Date & Author..: 2014/02/21 By yscheng
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_chk_process_exists(ls_session,ls_account)
   DEFINE ls_session    LIKE loga_t.loga005   # session編號
   DEFINE ls_account    LIKE loga_t.loga001   # 使用者編號
   DEFINE li_stus       LIKE type_t.num5
   DEFINE li_sql        STRING
   DEFINE li_str        STRING
   DEFINE li_cnt        LIKE type_t.num5
   DEFINE li_exit       LIKE loga_t.loga008   # 離開編號

   WHENEVER ERROR CALL cl_err_msg_log

   LET li_stus = FALSE
   LET li_str  = ''
   LET li_cnt  = 0
   LET li_exit = ''
   
   # 若session代號為空，不往下檢查
   IF cl_null(ls_session) THEN
      RETURN li_stus
   END IF

   # 使用者編號有可能為空，所以須做額外判斷才能組出WHERE條件
   LET li_str = " loga005 = '",ls_session CLIPPED,"'"
   IF NOT cl_null(ls_account) THEN
      LET li_str = li_str," AND loga001 = '",ls_account CLIPPED,"'"
   END IF
   
   # 判斷記錄檔中是否有此session的紀錄
   LET li_sql = "SELECT COUNT(1) FROM loga_t",    #170525-00010#2
                " WHERE ",li_str,
                "   AND logaent = ",g_enterprise  #180312-00040#1 增加 ent條件
   
   PREPARE cl_chk_process_count_pre FROM li_sql
   EXECUTE cl_chk_process_count_pre INTO li_cnt
   IF li_cnt = 0 THEN
      RETURN li_stus
   END IF
   
   # 判斷此session是否已終止
   LET li_sql = "SELECT loga008 FROM loga_t",
                " WHERE ",li_str,
                "   AND logaent = ",g_enterprise  #180312-00040#1 增加 ent條件
   
   PREPARE cl_chk_process_exit_pre FROM li_sql
   EXECUTE cl_chk_process_exit_pre INTO li_exit
  
   # 若記錄檔中沒有此session的離開編號，表示此session仍存在  
   IF NOT cl_null(li_exit) THEN
      LET li_stus = TRUE
   END IF
   
   RETURN li_stus
END FUNCTION

################################################################################
# Descriptions...: 原程式在 openfile 前做 cl_chk_file_writeable 檢查，沒有權限時顯示錯誤訊息後 Return 不繼續。
#                     
# Memo...........: 檢查是否該檔案已存在
#                     存在則使用 os.Path.writable 檢查 (依照檢查狀況直接回傳)
#                     不存在則做一次 touch，做完 touch後檢查該指定檔是否存在  存在:  os.path.delete 後回傳 ok / 不存在  回傳 FALSE
# Usage..........: CALL cl_chk_file_writeable(ps_fullpath)
#                  RETURNING TRUE/FALSE
# Input parameter: ps_fullpath 檔案路徑 STRING 
#                : 
# Return code....: TRUE 有權限/FALSE 沒有權限
#                : 
# Date & Author..: 2014/08/14 by jrg542
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_chk_file_writeable(ps_fullpath)
   DEFINE ps_fullpath STRING 
   DEFINE ls_cmd      STRING 

   WHENEVER ERROR CALL cl_err_msg_log

   #檢查檔案是否存在
   IF os.Path.exists(ps_fullpath) THEN
      IF os.Path.writable(ps_fullpath) THEN 
         #有寫檔權限
         RETURN TRUE  
      ELSE 
         RETURN FALSE 
      END IF   
   ELSE 
      #使用 touch 
      #If file.txt exists,touch updates its access and modification times to the current time. 
      #If file.txt doesn't exist,it is created as a new, empty file. 
      LET ls_cmd = "touch " , ps_fullpath
      RUN ls_cmd
      
      IF os.Path.exists(ps_fullpath) THEN
         IF os.Path.delete(ps_fullpath) THEN END IF 
         RETURN TRUE  
      ELSE 
         RETURN FALSE 
      END IF 
   END IF
END FUNCTION
################################################################################
# Descriptions...: 確認本單據的docdt欄位是否可以被修改
# Usage..........: CALL cl_chk_update_docdt() RETURNING TRUE/FALSE
# Input parameter:
# Return code....: TRUE 有權限/FALSE 沒有權限
# Date & Author..: 2014/08/14 by jrg542
################################################################################
PUBLIC FUNCTION cl_chk_update_docdt()
   DEFINE li_status     LIKE type_t.num5
   DEFINE lc_s_bas_0029 LIKE type_t.chr10
   DEFINE lc_s_bas_0030 LIKE type_t.chr10
   DEFINE lc_gzza017    LIKE gzza_t.gzza017
   DEFINE ls_sql        STRING              #190725-00001
   DEFINE lc_gzyh001    LIKE gzyh_t.gzyh001 #190725-00001  
   DEFINE li_cnt        LIKE type_t.num5    #190725-00001
   
   WHENEVER ERROR CALL cl_err_msg_log

   #初始化回傳值
   LET li_status = TRUE

   #Begin: #190725-00001
   LET lc_gzyh001 = cl_get_main_prog_module(g_code)

   SELECT COUNT(1) INTO li_cnt FROM GZYH_T WHERE GZYH001 = UPPER(lc_gzyh001) AND GZYH004='3'

   IF li_cnt > 0 THEN
      RETURN FALSE
   END IF
   #End: #190725-00001

   LET lc_s_bas_0029 = cl_get_para(g_enterprise,g_site,"S-BAS-0029")
   CASE
      #1.依據點 2.依作業(程式) 3.依角色
      WHEN lc_s_bas_0029 = "1"
         LET lc_s_bas_0030 = cl_get_para(g_enterprise,g_site,"S-BAS-0030")
         #IF lc_s_bas_0030 IS NOT NULL AND lc_s_bas_0030 = "Y" THEN # 160318-00004 1. 修正 S-BAS-0030 0.可修改 1.不可修改  
         IF lc_s_bas_0030 IS NOT NULL AND lc_s_bas_0030 = "0" THEN
            LET li_status = TRUE
         ELSE
            LET li_status = FALSE
         END IF

      #依角色
      WHEN lc_s_bas_0029 = "3"
         LET li_status = cl_auth_chk_docdt()

      OTHERWISE  #WHEN lc_bas_0029 = "2"   #抓到的資料有問題時,一律依作業
         SELECT gzza017 INTO lc_gzza017 FROM gzza_t WHERE gzza001 = g_code
         IF SQLCA.SQLCODE THEN
            LET li_status = FALSE  #發生錯誤時,一律設定為不可修改
         END IF
         IF cl_null(lc_gzza017) THEN
            LET lc_gzza017 = "2"
         END IF

         CASE   #SCC-54 進銷存單據日期/過帳日期控管方式
            WHEN lc_gzza017 = "0"   #可修改
               LET li_status = TRUE
            WHEN lc_gzza017 = "1"   #不可修改
               LET li_status = FALSE
            OTHERWISE               #依照營運據點設定
               LET lc_s_bas_0030 = cl_get_para(g_enterprise,g_site,"S-BAS-0030")
               #IF lc_s_bas_0030 IS NOT NULL AND lc_s_bas_0030 = "Y" THEN       #170123-00018 mark
               IF lc_s_bas_0030 IS NOT NULL AND lc_s_bas_0030 = "0" THEN        #170123-00018
                  LET li_status = TRUE
               ELSE
                  LET li_status = FALSE
               END IF
         END CASE
   END CASE

   RETURN li_status

END FUNCTION
################################################################################
# Descriptions...: 確認本單據的pstdt欄位是否可以被修改
# Usage..........: CALL cl_chk_update_pstdt() RETURNING TRUE/FALSE
# Input parameter:
# Return code....: TRUE 有權限/FALSE 沒有權限
# Date & Author..: 2014/08/14 by jrg542
################################################################################
PUBLIC FUNCTION cl_chk_update_pstdt()
   DEFINE li_status     LIKE type_t.num5
   DEFINE lc_s_bas_0031 LIKE type_t.chr10
   DEFINE lc_s_bas_0032 LIKE type_t.chr10
   DEFINE lc_gzza018    LIKE gzza_t.gzza018

   WHENEVER ERROR CALL cl_err_msg_log

   #初始化回傳值
   LET li_status = TRUE

   LET lc_s_bas_0031 = cl_get_para(g_enterprise,g_site,"S-BAS-0031")
   CASE
      #1.依據點 2.依作業(程式) 3.依角色
      WHEN lc_s_bas_0031 = "1"
         LET lc_s_bas_0032 = cl_get_para(g_enterprise,g_site,"S-BAS-0032")
         #IF lc_s_bas_0032 IS NOT NULL AND lc_s_bas_0032 = "Y" THEN      #170123-00018 mark
         IF lc_s_bas_0032 IS NOT NULL AND lc_s_bas_0032 = "0" THEN       ##170123-00018 
            LET li_status = TRUE
         ELSE
            LET li_status = FALSE
         END IF

      #依角色
      WHEN lc_s_bas_0031 = "3"
         #LET li_status = cl_auth_chk_docdt()       #170613-00046
         LET li_status = cl_auth_chk_pstdt()        #170613-00046

      OTHERWISE  #WHEN lc_bas_0031 = "2"   #抓到的資料有問題時,一律依作業
         SELECT gzza018 INTO lc_gzza018 FROM gzza_t WHERE gzza001 = g_code
         IF SQLCA.SQLCODE THEN
            LET li_status = FALSE  #發生錯誤時,一律設定為不可修改
         END IF
         IF cl_null(lc_gzza018) THEN
            LET lc_gzza018 = "2"
         END IF

         CASE   #SCC-54 進銷存單據日期/過帳日期控管方式
            WHEN lc_gzza018 = "0"   #可修改
               LET li_status = TRUE
            WHEN lc_gzza018 = "1"   #不可修改
               LET li_status = FALSE
            OTHERWISE               #依照營運據點設定
               LET lc_s_bas_0032 = cl_get_para(g_enterprise,g_site,"S-BAS-0032")
               #IF lc_s_bas_0032 IS NOT NULL AND lc_s_bas_0032 = "Y" THEN       #170123-00018 mark
               IF lc_s_bas_0032 IS NOT NULL AND lc_s_bas_0032 = "0" THEN        #170123-00018
                  LET li_status = TRUE
               ELSE
                  LET li_status = FALSE
               END IF
         END CASE
   END CASE

   RETURN li_status

END FUNCTION

################################################################################
# Descriptions...: 檢核字串中間是否有空白
# Memo...........:
# Usage..........: CALL cl_chk_mediate_blank(ps_str)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
# Return code....: 回传参数变量1   回传参数变量说明1
# Date & Author..: 日期 By jrg542
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_chk_mediate_blank(ps_str)
   DEFINE ps_str   STRING
   DEFINE li_pos   LIKE type_t.num5
   DEFINE li_chk   LIKE type_t.num5

   LET ps_str = ps_str.trim()

   LET li_chk = FALSE
   FOR li_pos = 1 TO ps_str.getLength()
      CASE ps_str.subString(li_pos,li_pos)
         WHEN ASCII(32)
            LET li_chk = TRUE #有空白
            EXIT FOR
      END CASE
   END FOR

   RETURN li_chk 
END FUNCTION

################################################################################
# Descriptions...: 檢核日期格式
# Memo...........:
# Usage..........: CALL cl_chk_is_date(ps_str)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
# Return code....: 回传参数变量1   回传参数变量说明1
# Date & Author..: 2016/03/25 By jrg542
# Modify.........: #160808-00003 #1
################################################################################
PUBLIC FUNCTION cl_chk_is_date(ps_str)
   DEFINE ps_date     DATE 
   DEFINE ps_str      LIKE type_t.chr20
   DEFINE l_token     base.StringTokenizer
   DEFINE ls_token    STRING 
   DEFINE lc_str      LIKE type_t.chr20

   LET l_token = base.StringTokenizer.create(ps_str,"/")
   WHILE l_token.hasMoreTokens()
      LET ls_token = l_token.nextToken()
      LET ls_token = ls_token.trim()
      #yyyy 
      IF ls_token.getLength() < 4 THEN   #yyyy 年
         RETURN FALSE
      END IF 
      LET lc_str = ls_token
      LET ls_token = l_token.nextToken()
      LET ls_token = ls_token.trim()
      #mm
      IF ls_token.getLength() = 0 THEN   #mm  月
         RETURN FALSE
      END IF 
      LET lc_str = lc_str ,"/",ls_token

      LET ls_token = l_token.nextToken()
      LET ls_token = ls_token.trim() 
      #dd      
      IF ls_token.getLength() = 0 THEN   #dd 日
         RETURN FALSE
      END IF 

      LET lc_str = lc_str ,"/",ls_token
      EXIT WHILE
   END WHILE 
   
   #SELECT TO_DATE(lc_str,'yyyy/mm/dd') INTO ps_date FROM dual  #200203-00002#1   mark              
   LET ps_date= DATE(lc_str)                                    #200203-00002#1   add   
   #IF SQLCA.sqlcode THEN                                       #200203-00002#1   mark
   IF cl_null(ps_date) THEN                                     #200203-00002#1   add
      RETURN FALSE
   END IF 
   #IF cl_null(ps_date) THEN 
   #    RETURN FALSE
   #END IF 
   RETURN TRUE 
END FUNCTION

################################################################################
# Descriptions...: 檢核mail 格式
# Memo...........:
# Usage..........: CALL cl_chk_email(ps_eamil)
#                  RETURNING TRUE/FALSE
# Input parameter: ps_eamil       mail帳號
# Return code....: TRUE           格式正確
#                : FALSE          格式錯誤
# Date & Author..: 2017/07/21 #170721-00008 #1
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_chk_email(ps_eamil)
   DEFINE ps_eamil   STRING 
   DEFINE ls_front    STRING
   DEFINE ls_final    STRING
   DEFINE li_pos     LIKE type_t.num5
   DEFINE li_cnt     LIKE type_t.num5
   DEFINE li_chk     LIKE type_t.num5
   DEFINE li_pos2    LIKE type_t.num5
   DEFINE li_chk2    LIKE type_t.num5 
   
   IF ps_eamil.getIndexOf("@",1) THEN
      #開頭一定要是英文或數字
      #最後一個字元只能是大小寫英文 
      #在@前面及後面「-.」、「--」、「..」、「.-」 不連連續出現
      #@ 後面一定有 「.」 
      LET li_pos = ps_eamil.getIndexOf("@",1)
      LET ls_front = ps_eamil.subString(1,li_pos-1)                       #收件者名稱
      LET ls_final = ps_eamil.subString(li_pos+1,ps_eamil.getLength())    #收件者主機

      #開頭一定要是英文或數字
      IF ps_eamil.subString(1,1) NOT MATCHES "[01-9A-Za-z]" THEN 
         DISPLAY "check mail fail:",ps_eamil
         RETURN FALSE 
      END IF 

      #最後一個字元只能是大小寫英文 
      IF ps_eamil.subString(ps_eamil.getLength(),ps_eamil.getLength()) NOT MATCHES "[A-Za-z]" THEN 
         DISPLAY "check mail fail 1:",ps_eamil
         RETURN FALSE 
      END IF

      LET li_chk = FALSE 
      LET li_chk2 = FALSE 
      LET li_cnt = 0
      #@不可以一個以上 
      FOR li_pos = 1 TO ps_eamil.getLength()
          IF ps_eamil.subString(li_pos, li_pos) MATCHES "[@]" THEN
             LET li_cnt = li_cnt + 1 
          END IF 
          IF li_cnt >= 2 THEN 
             DISPLAY "check mail fail 2:",ps_eamil
             LET li_chk = TRUE 
             EXIT FOR
          END IF 
          IF ps_eamil.subString(li_pos, li_pos) = "[" OR ps_eamil.subString(li_pos, li_pos) = "]" THEN
             DISPLAY "check mail fail 3:",ls_front.subString(li_pos, li_pos) 
             LET li_chk = TRUE 
             EXIT FOR
          END IF
          #特殊字元
          IF ps_eamil.subString(li_pos, li_pos) MATCHES "[~!#$%^&*()+=,/`:;\"']" THEN
             LET li_chk = TRUE 
             DISPLAY "check mail fail 4:",ps_eamil.subString(li_pos, li_pos)
             EXIT FOR 
          END IF 
          
          CASE 
             WHEN ps_eamil.subString(li_pos, li_pos) MATCHES "[01-9A-Za-z_]" 

             WHEN ps_eamil.subString(li_pos, li_pos) MATCHES "[-.@]"

                #@ 前面及後面都不能連續出現「-」及「.」，例如「-.」、「–」、「..」、「.-」
                IF ps_eamil.subString(li_pos+1, li_pos+1) MATCHES "[-.]" THEN
                   LET li_chk = TRUE 
                   DISPLAY "check mail fail 5:",ps_eamil.subString(li_pos+1, li_pos+1)
                   EXIT FOR 
                END IF 
                IF ps_eamil.subString(li_pos, li_pos) = "@" THEN
                   #@ 後面一定有 「.」 
                   FOR li_pos2 = 1 TO ls_final.getLength()
                       IF ls_final.subString(li_pos2, li_pos2) MATCHES "[.]" THEN
                          LET li_chk2 = TRUE   
                          DISPLAY "check mail have dot:",ls_final
                          EXIT FOR
                       END IF 
                   END FOR 
                   IF NOT li_chk2 THEN 
                       DISPLAY "check mail fail 7:",ls_final
                      LET li_chk = TRUE 
                      EXIT FOR
                   END IF 
                END IF   
             OTHERWISE 
                DISPLAY "check mail fail 8:",ps_eamil.subString(li_pos, li_pos)
                LET li_chk = TRUE
                EXIT FOR 
          END CASE 
      END FOR 
      IF li_chk THEN 
          RETURN FALSE  
      END IF 
       
   ELSE 
       DISPLAY "check mail fail 9"
       RETURN FALSE
   END IF    
   RETURN TRUE 
END FUNCTION

################################################################################
# Descriptions...: 測試 mongodb 連線
# Memo...........:
# Usage..........: CALL cl_chk_test_mongodb(ps_new,ps_old)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: #180312-00040#1 By 08146
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_chk_test_mongodb(ps_new,ps_old)
   DEFINE ps_new       STRING 
   DEFINE ps_old       STRING
   DEFINE ls_gzda001   LIKE gzda_t.gzda001
   DEFINE ls_gzda003   LIKE gzda_t.gzda003
   DEFINE ls_gzda004   LIKE gzda_t.gzda004
   DEFINE ls_gzda006   LIKE gzda_t.gzda006
   DEFINE ls_gzda007   LIKE gzda_t.gzda007

   IF ps_new = 1 AND ps_old = 2 THEN
      SELECT gzda001,gzda003, gzda004,gzda006,gzda007 INTO ls_gzda001,ls_gzda003,ls_gzda004,ls_gzda006,ls_gzda007
        FROM gzda_t
       WHERE gzda001 = 'mongo'
         AND gzdastus = 'Y'
      
      IF cl_null(ls_gzda003) OR cl_null(ls_gzda004) THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "" 
         LET g_errparam.code   = "aps-00172"
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         RETURN FALSE
      ELSE
         IF NOT cl_db_test_connect(ls_gzda001,ls_gzda003,ls_gzda004,ls_gzda006,ls_gzda007) THEN 
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = ls_gzda001
            LET g_errparam.code   = "azz-00370"
            LET g_errparam.popup  = TRUE
            CALL cl_err()
            RETURN FALSE
         END IF  
      END IF 
   END IF 
   
   RETURN TRUE 
END FUNCTION

################################################################################
# Descriptions...: 判斷是否為1.0與3.0混用的環境
#                  若為單一系統則回傳 none
#                  若為合併其他系統，則回傳高位的系統名稱，如 v3
# Memo...........:
# Usage..........: CALL cl_chk_systemcombined()
#                  RETURNING ls_return
# Input parameter: 
# Return code....: ls_return      單一系統：none  合併其他系統：回傳高位的系統名稱，如 v3
# Date & Author..: Create by #181128-00048
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_chk_systemcombined()
   DEFINE ls_return  LIKE type_t.chr10
   DEFINE ls_path    STRING


   LET ls_return = "none"

   LET ls_path = os.Path.join(os.Path.join(os.Path.join(FGL_GETENV("TOP"),"erp"),"aoo"),"4gl")
   IF os.Path.isLink(ls_path) THEN
      LET ls_return = "v3"
   END IF

   RETURN ls_return
   
END FUNCTION

 
{</section>}
 
