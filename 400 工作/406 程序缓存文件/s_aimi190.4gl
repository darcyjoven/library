#該程式未解開Section, 採用最新樣板產出!
#該程式為freestyle程式!
{<section id="s_aimi190.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0006(), PR版次:0006(2015-03-04 11:15:34)
#+ Customerized Version.: SD版次:(), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000144
#+ Filename...: s_aimi190
#+ Description: 抓取单位换算率
#+ Creator....: 00537(2013-09-11 00:00:00)
#+ Modifier...: 00000 -SD/PR- 01588
 
{</section>}
 
{<section id="s_aimi190.global" type="s" >}
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
 
{<section id="s_aimi190.free_style_variable" type="s" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"

#end add-point
 
{</section>}
 
{<section id="s_aimi190.global_variable" type="s" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"

#end add-point
 
{</section>}
 
{<section id="s_aimi190.other_dialog" type="s" >}

 
{</section>}
 
{<section id="s_aimi190.other_function" readonly="Y" type="s" >}
################################################################################
# Descriptions...: 根据aooi009或是aooi010中设置的单位数量关系,取得单位间的转换率
# Memo...........:
# Usage..........: CALL s_aimi190_get_convert(p_itemno,p_unit1,p_unit2) RETURNING r_success,r_rate
# INPUT parameter: p_itemno  料件编号
#                : p_unit1   来源单位
#                : p_unit2   目的单位
# RETURN code....: r_success TRUE/FALSE
#                : r_rate    目的单位至来源单位的转换率
# Date & Author..: 12/11/02 By Carrier
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aimi190_get_convert(p_itemno,p_unit1,p_unit2)
   DEFINE p_itemno    LIKE imad_t.imad001
   DEFINE p_unit1     LIKE imad_t.imad002
   DEFINE p_unit2     LIKE imad_t.imad004
   DEFINE r_success   LIKE type_t.num5
   DEFINE r_rate      LIKE inaj_t.inaj014
   DEFINE l_success   LIKE type_t.num5
   DEFINE l_error1    LIKE type_t.num5
   DEFINE l_error2    LIKE type_t.num5
   DEFINE l_rate      LIKE inaj_t.inaj014
   DEFINE l_err       LIKE gzze_t.gzze001
   DEFINE l_str       STRING
   DEFINE l_flag1     LIKE type_t.chr1
   DEFINE l_flag2     LIKE type_t.chr1

   LET r_success = FALSE
   LET r_rate    = 0
   IF cl_null(p_unit1) THEN
      #传入的来源单位为Null
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00011'
      LET g_errparam.extend = p_itemno
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_rate
   END IF

   IF cl_null(p_unit2) THEN
      #传入的目的单位为Null
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00012'
      LET g_errparam.extend = p_itemno
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_rate
   END IF
   
   IF p_unit1 = p_unit2 THEN
      LET r_rate = 1
      LET r_success = TRUE
      RETURN r_success,r_rate
   END IF

   IF NOT cl_null(p_itemno) THEN
      LET l_error1 = 0   #2015/03/04 by stellar add
      LET l_error2 = 0   #2015/03/04 by stellar add
      #取aooi010中单位转换设定
      CALL s_aimi190_chk_item_conv(p_itemno,p_unit1,p_unit2,'1') RETURNING r_success,l_error1,r_rate
      IF r_success = FALSE THEN
         #取aooi010中反向的设定
         CALL s_aimi190_chk_item_conv(p_itemno,p_unit2,p_unit1,'2') RETURNING r_success,l_error2,r_rate
      END IF
      IF r_success = TRUE THEN
         RETURN r_success,r_rate
      ELSE
         #FOR后续不同的报错方式
         #没有维护资料
         IF l_error1 = 1 AND l_error2 = 1 THEN
            LET l_flag1 = '1'
         ELSE
            LET l_flag1 = '2'
         END IF
      END IF
   END IF

   #取aooi009中标准设定
   LET l_error1 = 0   #2015/03/04 by stellar add
   LET l_error2 = 0   #2015/03/04 by stellar add
   CALL s_aimi190_chk_conv(p_unit1,p_unit2,'1') RETURNING r_success,l_error1,r_rate
   IF r_success = FALSE THEN
      #取aooi009中反向的设定
      CALL s_aimi190_chk_conv(p_unit2,p_unit1,'2') RETURNING r_success,l_error2,r_rate
      IF r_success = FALSE THEN
         LET r_rate    = 0
         IF l_error1 = 1 AND l_error2 = 1 THEN
            LET l_flag2 = '1'
         ELSE
            LET l_flag2 = '2'
         END IF
         IF NOT cl_null(p_itemno) THEN
            IF l_flag1 = '1' AND l_flag2 = '1' THEN
               #没有设定 XX 与YY 的单位转换数据
               LET l_err = 'sub-00015'
            ELSE
               #XX与YY的单位转换率资料已无效
               LET l_err = 'sub-00016'
            END IF
         ELSE
            IF l_flag2 = '1' THEN
               #没有设定 XX 与YY 的单位转换数据
               LET l_err = 'sub-00013'
            ELSE
               #XX与YY的单位转换率资料已无效
               LET l_err = 'sub-00014'
            END IF
         END IF
      END IF
   END IF
   IF r_success = FALSE THEN
     #LET l_str = p_unit1 CLIPPED,'|',p_unit2 CLIPPED
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = l_err
      LET g_errparam.extend = p_itemno
      LET g_errparam.popup = FALSE
      LET g_errparam.replace[1] = p_unit1
      LET g_errparam.replace[2] = p_unit2
      CALL cl_err()

   END IF
   RETURN r_success,r_rate
END FUNCTION
################################################################################
# Descriptions...: 取得aooi010中设置的系统标准转换率
# Memo...........:
# Usage..........: CALL s_aimi190_chk_item_conv(p_itemno,p_unit1,p_unit2,p_type) RETURNING r_success,r_error,r_rate
# INPUT parameter: p_itemno  料件编号
#                : p_unit1   来源单位
#                : p_unit2   目的单位
#                : p_type    1 正向 2逆向
# RETURN code....: r_success TRUE/FALSE
#                : r_error   0.OK 1.转换率不存在 2.无效的转换率
#                : r_rate    目的单位至来源单位的转换率
# Date & Author..: 12/11/02 By Carrier
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aimi190_chk_item_conv(p_itemno,p_unit1,p_unit2,p_type)
   DEFINE p_itemno    LIKE imad_t.imad001
   DEFINE p_unit1     LIKE imad_t.imad002
   DEFINE p_unit2     LIKE imad_t.imad004
   DEFINE p_type      LIKE type_t.chr1
   DEFINE r_success   LIKE type_t.num5
   DEFINE r_rate      LIKE inaj_t.inaj014
   DEFINE r_error     LIKE type_t.num5
   DEFINE l_sql       STRING
   DEFINE l_imad003   LIKE imad_t.imad003
   DEFINE l_imad005   LIKE imad_t.imad005
   DEFINE l_imadstus  LIKE imad_t.imadstus

   LET r_success = FALSE
   LET r_rate = 0
   LET r_error = 1
   LET l_sql = "SELECT imad003,imad005,imadstus FROM imad_t ",
               " WHERE imad001 ='",p_itemno,"'",
               "   AND imad002 ='",p_unit1,"'",
               "   AND imad004 ='",p_unit2,"' ",
               "   AND imadent = ",g_enterprise
   #LET l_sql = cl_forupd_sql(l_sql)
   PREPARE s_aimi190_chk_item_conv_p FROM l_sql

   DECLARE s_aimi190_chk_item_conv_cl CURSOR FOR s_aimi190_chk_item_conv_p
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'DECLARE s_aimi190_chk_item_conv_cl:'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_error,r_rate
   END IF

   OPEN s_aimi190_chk_item_conv_cl
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'OPEN s_aimi190_chk_item_conv_cl:'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_error,r_rate
   END IF

   FETCH s_aimi190_chk_item_conv_cl INTO l_imad003,l_imad005,l_imadstus
   IF SQLCA.sqlcode THEN
   #  CALL cl_err('OPEN s_aimi190_chk_item_conv:',SQLCA.sqlcode,1)
      RETURN r_success,r_error,r_rate
   END IF

   #存在无效的转换关系
   IF l_imadstus = 'N' THEN
      LET r_error = 2
      RETURN r_success,r_error,r_rate
   END IF

   IF p_type = '1' THEN    #正向
      #目的单位数量/来源单位数量
      LET r_rate = l_imad005 / l_imad003
   ELSE                    #反向
      LET r_rate = l_imad003 / l_imad005
   END IF
   LET r_success = TRUE
   LET r_error = 0
   RETURN r_success,r_error,r_rate
END FUNCTION
################################################################################
# Descriptions...: 取得aooi009中设置的系统标准转换率
# Memo...........:
# Usage..........: CALL s_aimi190_chk_conv(p_unit1,p_unit2,p_type) RETURNING r_success,r_error,r_rate
# INPUT parameter: p_unit1   来源单位
#                : p_unit2   目的单位
#                : p_type    1 正向 2逆向
# RETURN code....: r_success TRUE/FALSE
#                : r_error   0.OK 1.转换率不存在 2.无效的转换率
#                : r_rate    目的单位至来源单位的转换率
# Date & Author..: 12/11/02 By Carrier
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aimi190_chk_conv(p_unit1,p_unit2,p_type)
   DEFINE p_unit1     LIKE oocc_t.oocc001
   DEFINE p_unit2     LIKE oocc_t.oocc003
   DEFINE p_type      LIKE type_t.chr1
   DEFINE r_success   LIKE type_t.num5
   DEFINE r_rate      LIKE inaj_t.inaj014
   DEFINE r_error     LIKE type_t.num5
   DEFINE l_sql       STRING
   DEFINE l_oocc002   LIKE oocc_t.oocc002
   DEFINE l_oocc004   LIKE oocc_t.oocc004
   DEFINE l_ooccstus  LIKE oocc_t.ooccstus

   LET r_success = FALSE
   LET r_rate = 0
   LET r_error = 1

   LET l_sql = "SELECT oocc002,oocc004,ooccstus FROM oocc_t ",
               " WHERE oocc001 ='",p_unit1,"'",
               "   AND oocc003 ='",p_unit2,"' ",
               "   AND ooccent = ",g_enterprise
   PREPARE s_aimi190_chk_conv_p FROM l_sql
   DECLARE s_aimi190_chk_conv_cl CURSOR FOR s_aimi190_chk_conv_p
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'DECLARE s_aimi190_chk_conv_cl:'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_error,r_rate
   END IF

   OPEN s_aimi190_chk_conv_cl
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'OPEN s_aimi190_chk_conv_cl:'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_error,r_rate
   END IF

   FETCH s_aimi190_chk_conv_cl INTO l_oocc002,l_oocc004,l_ooccstus
   IF SQLCA.sqlcode THEN
   #  INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = SQLCA.sqlcode
#      LET g_errparam.extend = 'OPEN s_aimi190_chk_conv_cl:'
#      LET g_errparam.popup = TRUE
#      CALL cl_err()

      RETURN r_success,r_error,r_rate
   END IF

   #存在无效的转换关系
   IF l_ooccstus = 'N' THEN
      LET r_error = 2
      RETURN r_success,r_error,r_rate
   END IF

   IF p_type = '1' THEN    #正向
      #目的单位数量/来源单位数量
      LET r_rate = l_oocc004 / l_oocc002
   ELSE                    #反向
      LET r_rate = l_oocc002 / l_oocc004
   END IF
   LET r_success = TRUE
   LET r_error = 0
   RETURN r_success,r_error,r_rate
END FUNCTION
################################################################################
# Descriptions...: 检查单位与料件的基础单位是否有转换率
# Memo...........:
# Usage..........: CALL s_aimi190_chk_base_convert(p_item,p_unit)
#                :    RETURNING r_success
# INPUT parameter: p_itemno  料件编号
#                : p_unit    单位
# RETURN code....: r_success TRUE有/FALSE没有
# Date & Author..: 12/12/25 By zhangllc
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aimi190_chk_base_convert(p_item,p_unit)
DEFINE p_item      LIKE imaa_t.imaa001
DEFINE p_unit      LIKE imaa_t.imaa006
DEFINE r_success   LIKE type_t.num5
DEFINE l_imaa006   LIKE imaa_t.imaa006  #基础单位
DEFINE l_rate      LIKE inaj_t.inaj014

   LET r_success = TRUE
   IF cl_null(p_item) OR cl_null(p_unit) THEN
      RETURN r_success   #缺少传参，不用检查
   END IF
   
   SELECT imaa006 INTO l_imaa006 FROM imaa_t
    WHERE imaaent = g_enterprise
      AND imaa001 = p_item
   IF cl_null(l_imaa006) THEN
      #此料未维护基础单位！请至[料件主档维护作业aimm200]补充完整！
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aim-00194'
      LET g_errparam.extend = p_item
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   CALL s_aimi190_get_convert(p_item,p_unit,l_imaa006) RETURNING r_success,l_rate
   IF NOT r_success THEN
      #此單位與料件基礎單位沒有換算率,請重新輸入！
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00132'
      LET g_errparam.extend = p_unit
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success
   END IF
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 取得aooi010中設置的來源數量與目的數量
# Memo...........:
# Usage..........: CALL s_aimi190_chk_item_conv_qty(p_itemno,p_unit1,p_unit2)
#                :      RETURNING r_success,r_error,r_qty1,r_qty2
# INPUT parameter: p_itemno  料件編號
#                : p_unit1   來源單位
#                : p_unit2   目的單位
# RETURN code....: r_success TRUE/FALSE
#                : r_error   0.OK 1.轉換率不存在 2.無效的轉換率
#                : r_qty1    來源數量
#                : r_qty2    目的數量
# Date & Author..: 14/12/31 By Sarah
# Modify.........: 複製s_aimi190_chk_item_conv來稍作調整
################################################################################
PUBLIC FUNCTION s_aimi190_chk_item_conv_qty(p_itemno,p_unit1,p_unit2)
   DEFINE p_itemno    LIKE imad_t.imad001
   DEFINE p_unit1     LIKE imad_t.imad002
   DEFINE p_unit2     LIKE imad_t.imad004
   DEFINE r_success   LIKE type_t.num5
   DEFINE r_error     LIKE type_t.num5
   DEFINE r_qty1      LIKE imad_t.imad003
   DEFINE r_qty2      LIKE imad_t.imad005
   DEFINE l_sql       STRING
   DEFINE l_imadstus  LIKE imad_t.imadstus

   LET r_success = FALSE
   LET r_error = 1
   LET r_qty1 = 1
   LET r_qty2 = 1
   
   LET l_sql = "SELECT imad003,imad005,imadstus FROM imad_t ",
               " WHERE imad001 ='",p_itemno,"'",
               "   AND imad002 ='",p_unit1,"'",
               "   AND imad004 ='",p_unit2,"' ",
               "   AND imadent = ",g_enterprise
   PREPARE s_aimi190_chk_item_conv_qty_p FROM l_sql

   DECLARE s_aimi190_chk_item_conv_qty_cl CURSOR FOR s_aimi190_chk_item_conv_qty_p
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'DECLARE s_aimi190_chk_item_conv_qty_cl:'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_error,r_qty1,r_qty2
   END IF

   OPEN s_aimi190_chk_item_conv_qty_cl
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'OPEN s_aimi190_chk_item_conv_qty_cl:'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_error,r_qty1,r_qty2
   END IF

   FETCH s_aimi190_chk_item_conv_qty_cl INTO r_qty1,r_qty2,l_imadstus
   IF SQLCA.sqlcode THEN
      RETURN r_success,r_error,r_qty1,r_qty2
   END IF

   #存在無效的轉換關係
   IF l_imadstus = 'N' THEN
      LET r_error = 2
      RETURN r_success,r_error,r_qty1,r_qty2
   END IF

   LET r_success = TRUE
   LET r_error = 0
   RETURN r_success,r_error,r_qty1,r_qty2
END FUNCTION

################################################################################
# Descriptions...: 取得aooi009設置的來源數量與目的數量
# Memo...........:
# Usage..........: CALL s_aimi190_chk_conv(p_unit1,p_unit2)
#                :      RETURNING r_success,r_error,r_qty1,r_qty2
# INPUT parameter: p_unit1   來源單位
#                : p_unit2   目的單位
# RETURN code....: r_success TRUE/FALSE
#                : r_error   0.OK 1.轉換率不存在 2.無效的轉換率
#                : r_qty1    來源數量
#                : r_qty2    目的數量
# Date & Author..: 14/12/31 By Sarah
# Modify.........: 複製s_aimi190_chk_conv來稍作調整
################################################################################
PUBLIC FUNCTION s_aimi190_chk_conv_qty(p_unit1,p_unit2)
   DEFINE p_unit1     LIKE oocc_t.oocc001
   DEFINE p_unit2     LIKE oocc_t.oocc003
   DEFINE r_success   LIKE type_t.num5
   DEFINE r_error     LIKE type_t.num5
   DEFINE r_qty1      LIKE oocc_t.oocc002
   DEFINE r_qty2      LIKE oocc_t.oocc004
   DEFINE l_sql       STRING
   DEFINE l_ooccstus  LIKE oocc_t.ooccstus

   LET r_success = FALSE
   LET r_error = 1
   LET r_qty1 = 1
   LET r_qty2 = 1

   LET l_sql = "SELECT oocc002,oocc004,ooccstus FROM oocc_t ",
               " WHERE oocc001 ='",p_unit1,"'",
               "   AND oocc003 ='",p_unit2,"' ",
               "   AND ooccent = ",g_enterprise
   PREPARE s_aimi190_chk_conv_qty_p FROM l_sql
   
   DECLARE s_aimi190_chk_conv_qty_cl CURSOR FOR s_aimi190_chk_conv_qty_p
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'DECLARE s_aimi190_chk_conv_qty_cl:'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_error,r_qty1,r_qty2
   END IF

   OPEN s_aimi190_chk_conv_qty_cl
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'OPEN s_aimi190_chk_conv_qty_cl:'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_error,r_qty1,r_qty2
   END IF

   FETCH s_aimi190_chk_conv_qty_cl INTO r_qty1,r_qty2,l_ooccstus
   IF SQLCA.sqlcode THEN
      RETURN r_success,r_error,r_qty1,r_qty2
   END IF

   #存在無效的轉換關係
   IF l_ooccstus = 'N' THEN
      LET r_error = 2
      RETURN r_success,r_error,r_qty1,r_qty2
   END IF

   LET r_success = TRUE
   LET r_error = 0
   RETURN r_success,r_error,r_qty1,r_qty2
END FUNCTION

################################################################################
# Descriptions...: 取的aooi009或是aooi010中設置的來源數量與目的數量
# Memo...........:
# Usage..........: CALL s_aimi190_get_convert1(p_itemno,p_unit1,p_unit2)
#                :      RETURNING r_success,r_qty1,r_qty2
# INPUT parameter: p_itemno  料件編號
#                : p_unit1   來源單位
#                : p_unit2   目的單位
# RETURN code....: r_success TRUE/FALSE
#                : r_qty1    來源數量
#                : r_qty2    目的數量
# Date & Author..: 12/12/31 By Sarah
# Modify.........: 複製s_aimi190_get_convert來稍作調整
################################################################################
PUBLIC FUNCTION s_aimi190_get_convert1(p_itemno,p_unit1,p_unit2)
   DEFINE p_itemno    LIKE imad_t.imad001
   DEFINE p_unit1     LIKE imad_t.imad002
   DEFINE p_unit2     LIKE imad_t.imad004
   DEFINE r_success   LIKE type_t.num5
   DEFINE r_qty1      LIKE imad_t.imad003
   DEFINE r_qty2      LIKE imad_t.imad005
   DEFINE l_success   LIKE type_t.num5
   DEFINE l_error1    LIKE type_t.num5
#   DEFINE l_error2    LIKE type_t.num5   #2015/03/04 by stellar mark
   DEFINE l_rate      LIKE inaj_t.inaj014
   DEFINE l_err       LIKE gzze_t.gzze001
   DEFINE l_str       STRING
   DEFINE l_flag1     LIKE type_t.chr1
   DEFINE l_flag2     LIKE type_t.chr1

   LET r_success = FALSE
   LET r_qty1    = 1
   LET r_qty2    = 1
   
   IF cl_null(p_unit1) THEN
      #傳入的來源單位為Null
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00011'
      LET g_errparam.extend = p_itemno
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_qty1,r_qty2
   END IF

   IF cl_null(p_unit2) THEN
      #傳入的目的單位為Null
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00012'
      LET g_errparam.extend = p_itemno
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_qty1,r_qty2
   END IF
   
   IF p_unit1 = p_unit2 THEN
      LET r_success = TRUE
      RETURN r_success,r_qty1,r_qty2
   END IF

   IF NOT cl_null(p_itemno) THEN
      #取aooi010中來源數量與目的數量
      CALL s_aimi190_chk_item_conv_qty(p_itemno,p_unit1,p_unit2) RETURNING r_success,l_error1,r_qty1,r_qty2
      IF r_success = TRUE THEN
         RETURN r_success,r_qty1,r_qty2
      ELSE
         #FOR後續不同的報錯方式
         #沒有維護資料
         #2015/03/04 by stellar modify ----- (S)
#         IF l_error1 = 1 AND l_error2 = 1 THEN
         IF l_error1 = 1 THEN
         #2015/03/04 by stellar modify ----- (E)
            LET l_flag1 = '1'
         ELSE
            LET l_flag1 = '2'
         END IF
      END IF
   END IF

   #取aooi009中來源數量與目的數量
   CALL s_aimi190_chk_conv_qty(p_unit1,p_unit2) RETURNING r_success,l_error1,r_qty1,r_qty2
   IF r_success = FALSE THEN
      #2015/03/04 by stellar modify ----- (S)
#      IF l_error1 = 1 AND l_error2 = 1 THEN
      IF l_error1 = 1 THEN
      #2015/03/04 by stellar modify ----- (E)
         LET l_flag2 = '1'
      ELSE
         LET l_flag2 = '2'
      END IF
      IF NOT cl_null(p_itemno) THEN
         IF l_flag1 = '1' AND l_flag2 = '1' THEN
            #沒有設定 XX 與YY 的單位轉換資料
            LET l_err = 'sub-00015'
         ELSE
            #XX與YY的單位轉換率資料已無效
            LET l_err = 'sub-00016'
         END IF
      ELSE
         IF l_flag2 = '1' THEN
            #沒有設定 XX 與YY 的單位轉換資料
            LET l_err = 'sub-00013'
         ELSE
            #XX與YY的單位轉換率資料已無效
            LET l_err = 'sub-00014'
         END IF
      END IF
   END IF
   IF r_success = FALSE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = l_err
      LET g_errparam.extend = p_itemno
      LET g_errparam.popup = FALSE
      LET g_errparam.replace[1] = p_unit1
      LET g_errparam.replace[2] = p_unit2
      CALL cl_err()

   END IF
   RETURN r_success,r_qty1,r_qty2
END FUNCTION

 
{</section>}
 
