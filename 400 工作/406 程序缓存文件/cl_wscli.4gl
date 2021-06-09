#該程式未解開Section, 採用最新樣板產出!
#該程式為freestyle程式!
{<section id="cl_wscli.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0005(1900-01-01 00:00:00), PR版次:0005(2018-08-30 15:45:14)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000074
#+ Filename...: cl_wscli
#+ Description: 整合服務元件
#+ Creator....: 07375(2016-09-07 15:30:50)
#+ Modifier...: 00000 -SD/PR- TOPSTD
 
{</section>}
 
{<section id="cl_wscli.global" type="s" >}
#應用 p00 樣板自動產生(Version:6)
#add-point:填寫註解說明 name="main.memo"
#170317-00032#1 2017/04/06 by nikoybeat  調整XML針對欄位日期型態調整組成格式
#170522-00034#1 2017/05/22 by nikoybeat  1. 調整整數顯示小數點問題
#                                        2. 修正欄位值為空取出TYPE為NULL問題
#170626-00040#1 2017/06/26 By nikoybeat  調整cl_wscli_buildRecord()可支援多組欄位
#171031-00011#1 2017/10/31 by 00544      指定中台主機
#180724-00071#1 2018/07/25 By 10553      client端XML格式request新增datakey功能
#end add-point
#add-point:填寫註解說明(客製用) name="main.memo_customerization"

#end add-point
#(ver:6) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:6) --- end ---
 
IMPORT os
#add-point:增加匯入項目 name="main.import"
IMPORT util
IMPORT xml
IMPORT com
#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
#add-point:增加匯入變數檔 name="global.inc"
GLOBALS "../../cfg/top_ws.inc"            #TIPTOP Service Gateway 使用的全域變數檔
#end add-point
 
{</section>}
 
{<section id="cl_wscli.free_style_variable" type="s" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"
 
#end add-point
 
{</section>}
 
{<section id="cl_wscli.global_variable" type="s" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"
TYPE type_g_attribute DYNAMIC ARRAY OF RECORD
                name         STRING,      #屬性名稱
                value        STRING       #屬性值
             END RECORD
DEFINE g_param_rec      type_g_attribute  #Parameter Record Field陣列
DEFINE gx_response      xml.DomDocument   #CDATA 底下的<response>
DEFINE g_reqdoc         xml.DomDocument
DEFINE g_mnode             xml.DomNode       #master所在節點
DEFINE g_dnode             xml.DomNode       #<data> 節點
DEFINE g_snode             xml.DomNode       #<Status> 節點
DEFINE g_pnode             xml.DomNode       #<Parameter> 節點
DEFINE g_mst_count      INTEGER           #考慮多筆資料時的 id 序號計數
DEFINE g_payload_resp   xml.DomDocument
DEFINE g_master_record     xml.DomNode
DEFINE g_detail_n          xml.DomNode
#170522-00034#1-S
DEFINE g_input   DYNAMIC ARRAY OF RECORD   #傳入record
       name      STRING,
       type      STRING
      END RECORD
#170522-00034#1-E
#end add-point
 
{</section>}
 
{<section id="cl_wscli.other_dialog" type="s" >}

 
{</section>}
 
{<section id="cl_wscli.other_function" readonly="Y" type="s" >}

################################################################################
# Descriptions...: 搜尋 <Parameter> 指定的欄位值
# Memo...........:
# Usage..........: CALL cl_wscli_getParameter(p_name)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_wscli_getParameter(p_name)
DEFINE p_name    STRING
DEFINE l_value   STRING
DEFINE l_node_list      xml.DomNodeList
DEFINE l_pnode          xml.DomNode
DEFINE l_tnode          xml.DomNode


    INITIALIZE l_value TO NULL

    IF cl_null(p_name) THEN
       RETURN NULL
    END IF


   #--------------------------------------------------------------------------#
   # 搜尋 <Parameter> 是否有指定名稱的欄位                                      #
   #--------------------------------------------------------------------------#   
   
    LET l_node_list = g_payload_resp.selectByXPath("//" || "parameter" || "[@key=\"" || p_name CLIPPED || "\"]","")
    IF l_node_list.getCount() > 0 THEN
       LET l_pnode = l_node_list.getitem(1)
       LET l_tnode = l_pnode.getFirstChild()
       #CDATA的格式,一定要取得第二個子節點才可取得到CDATA的資料.
       WHILE ( l_tnode IS NOT NULL )
         LET l_value = l_value , l_tnode.getNodeValue() 
         LET l_value = l_value.trim()         
         LET l_tnode = l_tnode.getNextSibling()
       END WHILE
    END IF

    RETURN l_value
   
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL cl_wscli_getMasterRowLength(p_name)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_wscli_getMasterRowLength(p_name)
    DEFINE p_name   STRING
    DEFINE l_list   xml.DomNodeList
    DEFINE l_cnt    INTEGER


    #--------------------------------------------------------------------------#
    # 搜尋 <data> 有多少筆對應的 <Master> 節點                             #
    #--------------------------------------------------------------------------#
    IF cl_null(p_name) THEN
       LET l_list = g_payload_resp.selectByXPath("//data")
    ELSE
       LET l_list = g_payload_resp.selectByXPath("//data[@name=\"" || p_name || "\"]/row","")  
    END IF

    LET l_cnt = l_list.getCount()
    RETURN l_cnt
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL cl_wscli_getMasterRow(p_i,p_name)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_wscli_getMasterRow(p_i,p_name)
    DEFINE p_i      INTEGER,
           p_name   STRING
    DEFINE l_list   xml.DomNodeList
    DEFINE l_i      INTEGER
    DEFINE l_node   xml.DomNode    
    DEFINE l_list2  xml.DomNodeList
    DEFINE l_value  STRING

    IF cl_null(p_i) OR p_i = 0 THEN
       RETURN NULL
    END IF
    
    IF cl_null(p_name) THEN
       LET l_list = g_payload_resp.selectByXPath("//data")
    ELSE
       LET l_list = g_payload_resp.selectByXPath("//data[@name=\"" || p_name || "\"]/row[@seq=\"" || p_i || "\"]", "") 
    END IF

    IF l_list IS NOT NULL THEN
          
          LET l_node = l_list.getItem(1)
          LET l_value = l_value, l_node.getNodeValue()
       
    END IF
    #FOR l_i = 1 TO l_list.getCount()
    #    LET l_node = l_list.getitem(l_i)
    #    IF l_i = p_i THEN
           #往下取得 <Record> 節點回傳
    #       LET l_list2 = l_node.getElementsByTagName("Record")
    #       LET l_node = l_list2.getitem(1)
    #       EXIT FOR
    #    END IF
    #END FOR

    RETURN l_node
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL cl_wscli_getDetailRowLength(p_node,p_name)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_wscli_getDetailRowLength(p_node,p_name)
    DEFINE p_node    xml.DomNode,
           p_name    STRING
    DEFINE l_list    xml.DomNodeList
    DEFINE l_list2   xml.DomNodeList
    DEFINE l_node    xml.DomNode
    DEFINE l_detail  xml.DomNode
    DEFINE l_i       INTEGER
    DEFINE l_cnt     INTEGER

    IF p_node IS NULL THEN
       RETURN 0
    END IF

    #LET l_node = p_node.getParentNode()   #從 <Record> 取 <Master> 父節點
    #LET l_node = l_node.getParentNode()   #再從 <Master> 取 <RecordSet> 父節點

    #--------------------------------------------------------------------------#
    # 搜尋 <RecordSet> 有對應的 <Detail> 節點                                  #
    #--------------------------------------------------------------------------#
    IF cl_null(p_name) THEN
       LET l_list = p_node.selectByXPath("//detail")
       RETURN l_list.getCount()
    ELSE       
       LET l_list = p_node.selectByXPath("//detail[@name=\"" || p_name || "\"]" , "") 
    END IF

    FOR l_i = 1 TO l_list.getCount()
        LET l_detail = l_list.getitem(l_i)
        IF l_detail.getAttribute("name") = p_name THEN
           LET l_list2 = l_detail.getElementsByTagName("row")
           RETURN l_list2.getCount()
        END IF
    END FOR
    LET l_cnt = 0   #找不到
    RETURN l_cnt
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL cl_wscli_getDetailRow(p_node,p_i,p_name)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_wscli_getDetailRow(p_node,p_i,p_name)
   DEFINE p_node    xml.DomNode,
           p_i       INTEGER,
           p_name    STRING
    DEFINE l_list    xml.DomNodeList
    DEFINE l_list2   xml.DomNodeList
    DEFINE l_node    xml.DomNode
    DEFINE l_node2   xml.DomNode
    DEFINE l_detail  xml.DomNode  
    DEFINE l_i       INTEGER


    IF p_node IS NULL THEN
       RETURN 0
    END IF

    #LET l_node = p_node.getParentNode()   #從 <Record> 取 <Master> 父節點
    #LET l_node = l_node.getParentNode()   #再從 <Master> 取 <RecordSet> 父節點

    #--------------------------------------------------------------------------#
    # 搜尋 <RecordSet> 有對應的 <Detail> 節點                                  #
    #--------------------------------------------------------------------------#
    IF cl_null(p_name) THEN
       LET l_list = p_node.selectByXPath("//detail")
    ELSE       
       LET l_list = p_node.selectByXPath("//detail[@name=\"" || p_name || "\"]" , "")        
    END IF

    FOR l_i = 1 TO l_list.getCount()
        LET l_detail = l_list.getitem(l_i)
        IF l_detail.getAttribute("name") = p_name THEN
           LET l_list2 = l_detail.getElementsByTagName("row")
           LET l_node2 = l_list2.getitem(p_i)  #取出指定的Record
           EXIT FOR
        END IF      
    END FOR

    RETURN l_node2
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL cl_wscli_getRowField(p_node,p_name)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_wscli_getRowField(p_node,p_name)
    DEFINE p_node    xml.DomNode,
           p_name    STRING
    DEFINE l_value   STRING
    DEFINE l_list    xml.DomNodeList
    DEFINE l_node    xml.DomNode
    DEFINE l_i       LIKE type_t.num10
    DEFINE l_name    STRING
    #170317-00032#1-S
    DEFINE l_type    STRING
    DEFINE l_date1   DATETIME YEAR TO DAY
    DEFINE l_date2   DATETIME YEAR TO SECOND
    DEFINE l_date3   DATETIME YEAR TO FRACTION(3)
    #170317-00032#1-E

    IF p_node IS NULL OR cl_null(p_name) THEN
       RETURN NULL
    END IF
    
    LET l_list = p_node.getElementsByTagName("field")
    IF l_list.getCount() > 0 THEN   #找的到節點才取值
       FOR l_i = 1 TO l_list.getCount()
          LET l_node = l_list.getitem(l_i)
          LET l_name = l_node.getAttribute("name")
          IF l_name = p_name THEN
             #170317-00032#1-S
             LET l_type = l_node.getAttribute("type")
             LET l_node = l_node.getFirstChild()
             LET l_value = l_node.getNodeValue()
             IF l_type = "date" THEN
                LET l_value = cl_wscli_buildDatetime(l_value)
                IF l_value.getLength() = 10 THEN
                   LET l_date1 = l_value
                   RETURN l_date1
                END IF
                IF l_value.getLength() = 19 THEN
                   LET l_date2 = l_value
                   RETURN l_date2
                END IF
                LET l_date3 = l_value
                RETURN l_date3
             END IF
             #170317-00032#1-E
             EXIT FOR
          END IF
       END FOR
    END IF

    RETURN l_value
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL cl_wscli_addParameter(p_key,p_value,p_type)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_wscli_addParameter(p_key,p_value,p_type)
DEFINE p_key            STRING
DEFINE p_value          STRING
DEFINE p_type           STRING
DEFINE l_node           xml.DomNode
DEFINE l_pnode          xml.DomNode
DEFINE l_payload_node   xml.DomNode

   IF g_pnode.hasAttribute("key") THEN 
      LET g_pnode = g_reqdoc.createElement("parameter")    #建立 <param> 
      CALL g_dnode.appendChild(g_pnode)
   END IF
   CALL g_pnode.setAttribute("key", p_key)   
   CALL g_pnode.setAttribute("type", p_type)
   LET l_pnode = g_reqdoc.createTextNode(p_value)
   CALL g_pnode.appendChild(l_pnode)
   
   
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL cl_wscli_setParamData(p_data_attr)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_wscli_setParamData(p_data_attr)
DEFINE p_data_attr            type_g_attribute
DEFINE l_i                    INTEGER
   
   {LET g_pnode = g_reqdoc.createElement("parameter")
   CALL g_dnode.appendChild(g_pnode)}

   FOR l_i = 1 TO p_data_attr.getLength()
      CALL g_pnode.setAttribute(p_data_attr[l_i].name, p_data_attr[l_i].value)
      CALL g_pnode.setAttribute("type", "data")
   END FOR
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL cl_wscli_addMasterRow(p_name,p_row,p_record)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_wscli_addMasterRow(p_name,p_row,p_record)
    DEFINE p_record            util.JSONObject,
           p_name              STRING,
           p_row               INTEGER
    DEFINE l_master_node     xml.DomNode,
           l_master_row      xml.DomNode,
           l_master_record   xml.DomNode
    DEFINE l_node_list       xml.DomNodeList
    DEFINE l_list1           xml.DomNodeList
    DEFINE l_res_root        xml.DomNode
    DEFINE l_tnode           xml.DomNode
    DEFINE l_pnode           xml.DomNode
    DEFINE l_child           xml.DomNode
    DEFINE l_i               INTEGER
    DEFINE l_j               INTEGER
    DEFINE l_end             INTEGER
    DEFINE l_name     STRING,
           l_value    STRING,
           l_type     STRING    

    WHENEVER ERROR CONTINUE

    IF p_record.getLength() = 0 THEN
       display "json length: 0"
       RETURN NULL
    END IF

   
    LET l_node_list = g_pnode.selectByXPath("//data[@name=\"" || p_name CLIPPED || "\"]","")
    IF l_node_list.getCount() = 0 THEN
       
       LET l_master_node = g_reqdoc.createElement("data")   #建立 <data> 節點
       CALL g_pnode.appendChild(l_master_node)
       IF NOT cl_null(p_name) THEN
          CALL l_master_node.setAttribute("name", p_name)
       END IF
       
       LET g_mnode = g_reqdoc.createElement("row")   #於 <data> 下建立 <row> 節點
       CALL l_master_node.appendChild(g_mnode)

       CALL g_mnode.setAttribute("seq", p_row)
              
    ELSE
       FOR l_i = 1 TO l_node_list.getCount()
           LET l_master_node = l_node_list.getItem(l_i)
       END FOR
       LET g_mnode = g_reqdoc.createElement("row")   #於 <data> 下建立 <row> 節點
       CALL l_master_node.appendChild(g_mnode)

       CALL g_mnode.setAttribute("seq", p_row)
    END IF 
    
    LET l_master_row = cl_wscli_getNodeByXPath(l_master_node, "row[@seq=\"" || p_row CLIPPED || "\"]")

    FOR l_i = 1 TO p_record.getLength()

       INITIALIZE l_name TO NULL
       INITIALIZE l_value TO NULL
       INITIALIZE l_type TO NULL

       #取得欄位名稱和欄位值
       LET l_name = p_record.name(l_i)
       LET l_value = p_record.get(p_record.name(l_i))
       LET l_type = p_record.getType(p_record.name(l_i))
       LET l_type = DOWNSHIFT(l_type)
       IF  l_type = "number" THEN
          LET l_type = "numeric"
          
          #170522-00034#1 - S
          #type為 numeric 整數 去除小數點
          LET l_end = l_value.getIndexOf(".0", 1)
          IF l_value.getLength() = l_end + 1 THEN
             LET l_value = l_value.subString(1, l_end - 1)
          ELSE
             LET l_value = l_value
          END IF
       ELSE 
          #欄位值為空，取回欄位型態值
          IF l_type = "null" THEN
             FOR l_j = 1 TO g_input.getLength()
                IF l_name = g_input[l_j].name THEN
                   LET l_type = g_input[l_j].type
                END IF
             END FOR
          END IF
          #170522-00034#1 - E
       END IF
       FOR l_j = 1 TO g_ws_datetype.getLength()
          IF l_name = g_ws_datetype[l_j].name THEN
             LET l_type = "date"
             LET l_value = cl_wscli_replace_special_char(l_value)  #170317-00032#1
             EXIT FOR
          END IF
       END FOR
       
       #於 <row> 下建立 <Field> 節點    
       LET l_child = g_reqdoc.createElement("field") 
       CALL g_mnode.appendChild(l_child)
       CALL l_child.setAttribute("name", l_name)
       CALL l_child.setAttribute("type", l_type)
       LET l_pnode = g_reqdoc.createTextNode(l_value)
       CALL l_child.appendChild(l_pnode)

   END FOR       #依照傳入的資料新增一筆單頭資料

   RETURN l_master_node 
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL cl_wscli_addDetailRow(p_name,p_row,p_detail_json,p_parent_node)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_wscli_addDetailRow(p_name,p_row,p_detail_json,p_parent_node)
DEFINE p_detail_json    util.JSONObject,
       p_name           STRING,
       p_row            INTEGER
DEFINE l_node           xml.DomNode,
       p_parent_node    xml.DomNode, 
       l_detail_node    xml.DomNode
DEFINE l_node_list      xml.DomNodeList
DEFINE l_list1          xml.DomNodeList
DEFINE l_res_root       xml.DomNode
DEFINE l_tnode          xml.DomNode
DEFINE l_dnode          xml.DomNode
DEFINE l_pnode          xml.DomNode
DEFINE l_child          xml.DomNode
DEFINE l_i              INTEGER
DEFINE l_j              INTEGER
DEFINE l_end            INTEGER
DEFINE p_level          STRING
DEFINE l_name     STRING,
       l_value    STRING,
       l_type     STRING

    WHENEVER ERROR CONTINUE

    #LET l_node_list = p_parent_node.selectByXPath("/detail[@name=\"" || p_name CLIPPED || "\"]","")
    LET l_node_list = p_parent_node.selectByXPath("//row[@seq=\"" || p_row CLIPPED || "\"]/detail[@name=\"" || p_name CLIPPED || "\"]","")
    
    IF l_node_list.getCount() = 0 THEN
       
       LET l_detail_node = g_reqdoc.createElement("detail")  # 產生 <detail>
       CALL l_detail_node.setAttribute("name", p_name)
       CALL g_mnode.appendChild(l_detail_node)               
       LET l_tnode = g_reqdoc.createElement("row")   #於 <detail> 下建立 <row> 節點
       CALL l_detail_node.appendChild(l_tnode)
    ELSE
        FOR l_i = 1 TO l_node_list.getCount()
            LET l_detail_node = l_node_list.getItem(l_i)
        END FOR
        LET l_tnode = g_reqdoc.createElement("row")   #於 <detail> 下建立 <row> 節點
        CALL l_detail_node.appendChild(l_tnode)
    END IF 
    
    FOR l_i = 1 TO p_detail_json.getLength()

       INITIALIZE l_name TO NULL
       INITIALIZE l_value TO NULL
       INITIALIZE l_type TO NULL

       #取得欄位名稱和欄位值
       LET l_name = p_detail_json.name(l_i)
       LET l_value = p_detail_json.get(p_detail_json.name(l_i))
       LET l_type = p_detail_json.getType(p_detail_json.name(l_i))
       LET l_type = DOWNSHIFT(l_type)
       IF  l_type = "number" THEN
          LET l_type = "numeric"
          
          #170522-00034#1 - S
          #type為 numeric 整數 去除小數點
          LET l_end = l_value.getIndexOf(".0", 1)
          IF l_value.getLength() = l_end + 1 THEN
             LET l_value = l_value.subString(1, l_end - 1)
          ELSE
             LET l_value = l_value
          END IF
       ELSE
          #欄位值為空，取回欄位型態值
          IF l_type = "null" THEN
             FOR l_j = 1 TO g_input.getLength()
                IF l_name = g_input[l_j].name THEN
                   LET l_type = g_input[l_j].type
                END IF
             END FOR
          END IF
          #170522-00034#1 - E
       END IF
       FOR l_j = 1 TO g_ws_datetype.getLength()
          IF l_name = g_ws_datetype[l_j].name THEN
             LET l_type = "date"
             LET l_value = cl_wscli_replace_special_char(l_value) #170317-00032#1
             EXIT FOR
          END IF
       END FOR
       
       #於 <row> 下建立 <Field> 節點    
       LET l_child = g_reqdoc.createElement("field") 
       CALL l_tnode.appendChild(l_child)
       CALL l_child.setAttribute("name", l_name)
       CALL l_child.setAttribute("type", l_type)
       LET l_pnode = g_reqdoc.createTextNode(l_value)
       CALL l_child.appendChild(l_pnode)

   END FOR
   RETURN l_detail_node 
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL cl_wscli_create_request_head(p_sync,p_service_attr)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_wscli_create_request_head(p_sync,p_service_attr)
   DEFINE p_sync                 STRING 
   DEFINE p_service_name         STRING             #service名稱   
   DEFINE l_req_doc              xml.DomDocument
   DEFINE l_request_root         xml.DomNode        #Request XML Node
   DEFINE l_tag                  STRING             #節點tag名稱
   DEFINE l_attr                 type_g_attribute   #節點屬性資料
   DEFINE l_node                 xml.DomNode
   DEFINE l_Request              STRING
   DEFINE l_xml_str              STRING
   DEFINE l_start                LIKE type_t.num10
   DEFINE l_end                  LIKE type_t.num10
   DEFINE p_service_attr         type_g_attribute
   
   INITIALIZE l_request_root TO NULL
   INITIALIZE l_node TO NULL
   CALL g_input.clear()  #20180830 add
   
   #建立 Request XML Document
   LET l_req_doc = xml.DomDocument.createDocument("request")
   LET l_request_root = l_req_doc.getDocumentElement()   
   
   #建立屬性資料
   IF cl_null(p_sync) THEN    
      LET p_sync = "sync"        #預設同步
   END IF
   CALL l_request_root.setAttribute("type", p_sync)   
   
   #建立TT主機資訊(<host>)
   LET l_tag = "host"
   CALL l_attr.clear()
   LET l_attr = cl_bpm_get_host_info()
   #LET l_attr[4].value = "t10tst"          #171031-00011
   CALL cl_bpm_create_node(l_req_doc, l_request_root, l_tag, l_attr)
      RETURNING l_req_doc, l_node

   #建立service資訊(<service>)
   LET l_tag = "service"  
   CALL cl_wscli_create_node(l_req_doc, l_request_root, l_tag, p_service_attr,"")
      RETURNING l_req_doc, l_node
   

   RETURN l_req_doc, l_request_root
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL cl_wscli_create_request()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_wscli_create_request()
    DEFINE l_node          xml.DomNode    
    DEFINE l_request_root  xml.DomNode
    DEFINE l_tnode         xml.DomNode
    DEFINE l_pnode         xml.DomNode

    INITIALIZE g_request_datakey TO NULL  #清空陣列 180724-00071#1 add by 10553 
    LET g_reqdoc = xml.DomDocument.createDocument("data_request")     
    CALL g_reqdoc.setFeature("format-pretty-print", true)
    
    LET l_request_root = g_reqdoc.getDocumentElement()

    LET g_dnode = g_reqdoc.createElement("datainfo")   #建立 <datainfo>
    CALL l_request_root.appendChild(g_dnode)
    LET g_pnode = g_reqdoc.createElement("parameter")       #於 <datainfo> 下建立 <parameter>    
    CALL g_dnode.appendChild(g_pnode)
    {LET g_dnode = g_reqdoc.createElement("datainfo")       #於 <payload> 下建立 <datainfo>
    CALL l_node.appendChild(g_dnode)}
    
    LET g_mst_count = 0
    
    RETURN l_request_root
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL cl_wscli_get_response(p_response_str)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_wscli_get_response(p_response_str)
   DEFINE p_response_str         STRING   
   DEFINE l_res_doc              xml.DomDocument
   DEFINE l_tag                  STRING             #節點tag名稱   
   DEFINE l_response_cdata       STRING   
   
   DEFINE l_node_list            xml.DomNodeList
   DEFINE l_record_node          xml.DomNode
   DEFINE l_child_node           xml.DomNode
   DEFINE l_name                 STRING
   DEFINE l_processSN            STRING
   DEFINE l_status               STRING
   DEFINE l_response_content     xml.DomNode
   
      
   DEFINE l_pnode                xml.DomNode
   DEFINE l_i                    LIKE type_t.num10
   DEFINE l_detail               xml.DomNode
   
   INITIALIZE l_response_content TO NULL   
  
   IF cl_null(p_response_str) THEN      
      RETURN l_response_content
   END IF 
   
   #編碼問題
   LET p_response_str = "<?xml version='1.0' encoding='UTF-8'?>",p_response_str   
   #建立 Response XML Document   
   LET l_res_doc = xml.DomDocument.create()    
   CALL l_res_doc.loadFromString(p_response_str)
   
   #response字串轉換成XML格式失敗
   IF l_res_doc IS NULL THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code =  "lib-00023"
      LET g_errparam.extend = "Response"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      #Response isn't valid XML document
      RETURN l_response_content
   END IF
   
   #取得服務執行結果狀態代碼 (<srvcode>)   
   LET g_srvcode = cl_bpm_get_node_value(l_res_doc, "srvcode")

   #服務執行結果狀態代碼
   IF g_srvcode <> "000" THEN 
      DISPLAY "srvcode:", g_srvcode     
   END IF
   
   #取得Response 處理(CDATA section 包覆的 XML 資料)                 
   LET l_tag = "param"
   #LET l_response_cdata = cl_wscli_getRowField(l_res_doc, "param")
   DISPLAY "response:", l_response_cdata, ";"

   #處理 CDATA XML Document   
   TRY
      LET gx_response = xml.DomDocument.create()
      CALL gx_response.loadFromString(l_response_cdata.trim())      
   CATCH
      RETURN l_response_content
   END TRY
   
   #--------------------------------------------------------------------------#
   # 搜尋 <Parameter> 的欄位                                                   #
   #--------------------------------------------------------------------------#
   CALL g_param_rec.clear()
   
   TRY
      #LET l_node_list = gx_response.selectByXPath("//Parameter/Record/Field", NULL)   
       LET l_node_list = gx_response.getElementsByTagName("Parameter")
       LET l_detail = l_node_list.getitem(1)
       LET l_node_list = l_detail.getElementsByTagName("Field")
   END TRY
   

   IF l_node_list.getCount() > 0 THEN
      FOR l_i = 1 TO l_node_list.getCount()
          LET l_pnode = l_node_list.getitem(l_i)
          LET g_param_rec[l_i].name = l_pnode.getAttribute("name")
          LET g_param_rec[l_i].value = l_pnode.getAttribute("value")
      END FOR
   END IF
   
   #取得處理結果
   LET l_tag = "Status"
   LET g_status.code = cl_bpm_get_node_attribute(gx_response, l_tag , "code")
   LET g_status.sqlcode = cl_bpm_get_node_attribute(gx_response, l_tag , "sqlcode")
   LET g_status.description = cl_bpm_get_node_attribute(gx_response, l_tag , "description")
   
   RETURN gx_response
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL cl_wscli_create_node(p_req_doc,p_node,p_tag,p_attr,p_value)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_wscli_create_node(p_req_doc,p_node,p_tag,p_attr,p_value)
   DEFINE p_req_doc              xml.DomDocument    #XML Document
   DEFINE p_node                 xml.DomNode        #要增加子節點的node
   DEFINE l_tnode                xml.DomNode        #建立文字
   DEFINE p_tag                  STRING             #子節點的tag名稱
   DEFINE p_value                STRING
   DEFINE p_attr                 type_g_attribute
  
   DEFINE l_child_node           xml.DomNode
   DEFINE l_i                    LIKE type_t.num5

   INITIALIZE l_child_node TO NULL

   #建立子節點node
   LET l_child_node = p_req_doc.createElement(p_tag)
   CALL p_node.appendChild(l_child_node)
   
   IF NOT cl_null(p_value) THEN
      LET l_tnode = p_req_doc.createTextNode(p_value)  
      CALL l_child_node.appendChild(l_tnode)
   END IF

   FOR l_i = 1 TO p_attr.getLength()
      CALL l_child_node.setAttribute(p_attr[l_i].name, p_attr[l_i].value)
   END FOR

   RETURN p_req_doc, l_child_node
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL cl_wscli_stringToXml(p_str)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_wscli_stringToXml(p_str)
   DEFINE p_str            STRING
   DEFINE l_doc            xml.DomDocument

   TRY
      LET l_doc = xml.DomDocument.Create()
      CALL l_doc.loadFromString(p_str)
      #CALL l_doc.load("/ut/t10dev/tmp/aa.xml")
      LET g_payload_resp = l_doc
   CATCH
      
   END TRY      
   RETURN l_doc
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_wscli_getNodeByXPath(p_parentNode,p_xpath)
DEFINE p_parentNode xml.DomNode
DEFINE p_xpath STRING

    DEFINE r_node xml.DomNode
    DEFINE l_nodeList xml.DomNodeList

    INITIALIZE r_node TO NULL

    LET l_nodeList = cl_wscli_getNodeListByXPath(p_parentNode, p_xpath)
    IF l_nodeList IS NOT NULL THEN
        IF 1 <= l_nodeList.getCount() THEN
            LET r_node = l_nodeList.getItem(1)
        END IF
    END IF

    RETURN r_node
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_wscli_getNodeListByXPath(p_parentNode,p_xpath)
DEFINE p_parentNode xml.DomNode
DEFINE p_xpath STRING

    DEFINE r_nodeList xml.DomNodeList

    INITIALIZE r_nodeList TO NULL
    IF p_parentNode IS NULL OR cl_null(p_xpath) THEN
        RETURN r_nodeList
    END IF

    LET r_nodeList = p_parentNode.selectByXPath(p_xpath, NULL)

    RETURN r_nodeList
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL cl_wscli_invokeSrv(p_json_record)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_wscli_invokeSrv(p_json_record)
   DEFINE p_json_record     util.JSONObject
   
   DEFINE l_Request         STRING
   DEFINE l_Result          STRING
   DEFINE l_host_att        STRING
   DEFINE l_request_att     STRING
   DEFINE l_service_attr    type_g_attribute
   DEFINE l_attr            type_g_attribute   #節點屬性資料
   
   DEFINE l_req_doc         xml.DomDocument
   DEFINE l_request_root    xml.DomNode           #Request XML Node
   DEFINE l_pnode           xml.DomNode
   DEFINE l_param_node      xml.DomNode           #add by 160527-00003
   DEFINE l_tnode           xml.DomNode
   DEFINE l_dnode           xml.DomNode
   DEFINE l_response        xml.DomDocument
   
   DEFINE l_xml_str         STRING
   DEFINE ls_prod           STRING
   DEFINE ls_srvname        STRING
   DEFINE ls_req_data       STRING
   DEFINE ls_sync_type      STRING
   DEFINE lb_sync           BOOLEAN
   
   DEFINE l_status          LIKE type_t.num10
   DEFINE l_start           LIKE type_t.num10
   DEFINE l_end             LIKE type_t.num10    
   
   DEFINE l_code            STRING
   DEFINE l_message         STRING
   DEFINE l_payload         STRING
   DEFINE l_payload_node    xml.DomNode
   DEFINE lr_result         RECORD
                              status STRING,
                              data   STRING,
                              request STRING
                            END RECORD
                            
   DEFINE ls_ip             STRING
   DEFINE ls_id             STRING
   DEFINE l_res_msg         RECORD
                              code  STRING,
                              desc   STRING,
                              sql_code STRING
                            END RECORD
                            
   DEFINE li_index          LIKE type_t.num5       #180724-00071#1 add by 10553
                              
   IF p_json_record.getLength() = 0 THEN 
      display "json length: 0"
      LET lr_result.status = -1
      RETURN lr_result.*
   END IF 
   
    
   #171031-00011-S  
   IF NOT cl_eai_set_server() THEN   
      LET lr_result.status = -1
      RETURN lr_result.*
   END IF  
   #171031-00011-E
   
   LET ls_prod     = p_json_record.get("prod")    
   LET ls_srvname  = p_json_record.get("srvname")    
   LET ls_ip       = p_json_record.get("ip")       
   LET ls_id       = p_json_record.get("id")       
   LET lb_sync     = p_json_record.get("async")
   LET ls_req_data = p_json_record.get("request")    
   
   #建立 Request XML Document
   LET l_service_attr[1].name = "prod"                                                                            
   LET l_service_attr[1].value = ls_prod
   
   LET l_service_attr[2].name = "name"                                                                            
   LET l_service_attr[2].value = ls_srvname
   
   LET l_service_attr[3].name = "srvver"
   LET l_service_attr[3].value = "1.0"
   #由 prod 產品別取回IP
   LET l_service_attr[4].name = "ip"
   IF cl_null(ls_ip) THEN
      LET l_service_attr[4].value = "10.40.41.216" #參考值,建議呼叫端直接給值
   ELSE
      LET l_service_attr[4].value = ls_ip
   END IF
   
   LET l_service_attr[5].name = "id"                                                                            
   LET l_service_attr[5].value = ls_id    

   CALL cl_wscli_create_request_head("sync",l_service_attr)
        RETURNING l_req_doc, l_request_root          
    
   #取得 host 及 service 字串 <host prod=.../>
   LET l_Request = l_request_root.toString()
   LET l_start = l_Request.getIndexOf("<host",1)
   LET l_end = l_Request.getIndexOf("/>",l_Request.getIndexOf("<service",l_start))   
   LET l_xml_str =  l_Request.subString(l_start,l_end+1)
   CALL l_request_root.setAttribute("key", cl_trust_crosskey(l_xml_str))

   #180724-00071#1 mark by 10553  (S)
   #LET l_attr[1].name = "EntId"
   #LET l_attr[1].value = g_enterprise   #171031-00011
   #LET l_attr[2].name = "CompanyId"
   #LET l_attr[2].value = g_site         #171031-00011
   #CALL cl_wscli_create_datakey(l_req_doc,l_request_root,l_attr)
   #180724-00071#1 mary by 10553  (E)
   #180724-00071#1 add by 10553  (S)
   LET li_index = g_request_datakey.getLength() + 1
   LET g_request_datakey[li_index].name = "EntId"
   LET g_request_datakey[li_index].value = g_enterprise
   LET g_request_datakey[li_index+1].name = "CompanyId"
   LET g_request_datakey[li_index+1].value = g_site
   CALL cl_wscli_create_datakey(l_req_doc,l_request_root,g_request_datakey)
   #180724-00071#1 add by 10553  (E)
   RETURNING l_req_doc, l_dnode
   CALL l_request_root.appendChild(l_dnode)
   
   
   # payload 資訊
   LET l_pnode = l_req_doc.createElement("payload")            #建立 <payload>   
   CALL l_request_root.appendChild(l_pnode)

   #add by 160527-00003 
   LET l_param_node =  l_req_doc.createElement("param")      #建立 <param>
   CALL l_param_node.setAttribute("key" ,"std_data")
   CALL l_param_node.setAttribute("type" ,"XML")
   #add by 160527-00003   

   #Append datainfo
   LET l_tnode = l_req_doc.createNode(ls_req_data.trim())
   #CALL l_pnode.appendChild(l_tnode)    #mark by 160527-00003
   
   CALL l_param_node.appendChild(l_tnode)      #add by 160527-00003
   CALL l_pnode.appendChild(l_param_node)      #add by 160527-00003
      
   #若 60 秒內無回應則放棄
  #CALL fgl_ws_setOption("http_invoketimeout", 60)
   CALL fgl_ws_setOption("http_invoketimeout", 100) #mod by pane 201211

   LET l_Request = l_request_root.toString()  
   DISPLAY l_Request
   #確認 CROSS 編碼
   LET l_Request = cl_trust_coding_en(l_Request) 
   LET lr_result.request = l_Request
   
   #呼叫 CROSS 服務
   CALL cl_eai_callSrv(l_Request)  RETURNING l_status, l_Result
    
   IF l_status != 0 THEN
      LET lr_result.status = l_status
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'lib-00299'     #呼叫 CROSS 服務失敗
      LET g_errparam.extend = l_status
      LET g_errparam.popup = TRUE
      CALL cl_err()
      
      RETURN lr_result.*
   END IF
   
   #確認 CROSS 解碼
   LET l_Result = cl_trust_coding_de(l_Result)
      
   LET l_response = xml.DomDocument.Create()
   CALL l_response.loadFromString(l_Result)
  
   
   LET l_code = cl_bpm_get_node_value(l_response, "code")
   LET l_message = cl_bpm_get_node_value(l_response, "message")
   
   IF l_code = "019" THEN  #產品資訊
      #LET l_payload = cl_bpm_get_node_value(l_response, "payload") 
      LET l_res_msg.desc = cl_bpm_get_node_attribute(l_response, "status", "description")
      IF NOT cl_null(l_res_msg.desc) THEN
         LET l_res_msg.code = cl_bpm_get_node_attribute(l_response, "status", "code")
         LET lr_result.status = l_res_msg.code
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'lib-00046'     #呼叫 CROSS 服務失敗
         LET g_errparam.extend = l_res_msg.desc
         LET g_errparam.popup = TRUE
         CALL cl_err()
      
         RETURN lr_result.*
      END IF
            
      LET l_payload_node = cl_wscli_getParamNode(l_response, "payload")
      LET l_payload = l_payload_node.toString()
      LET lr_result.status = "0"
      LET lr_result.data = l_payload
   ELSE
      LET lr_result.status = "100"
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'lib-00299'     #呼叫 CROSS 服務失敗
      LET g_errparam.extend = l_message
      LET g_errparam.popup = TRUE
      CALL cl_err()
   
   END IF  
   
   RETURN lr_result.*
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_wscli_create_datakey(p_resdoc,p_request_root,p_attr)
DEFINE p_resdoc         xml.DomDocument
DEFINE p_request_root   xml.DomNode
DEFINE p_attr           type_g_attribute
DEFINE l_node           xml.DomNode
DEFINE l_knode          xml.DomNode
DEFINE l_tnode          xml.DomNode
DEFINE l_i              INTEGER
   
   LET l_node = p_resdoc.createElement("datakey")    #建立 <datakey>   
   CALL l_node.setAttribute("type", "FOM")
   CALL p_request_root.appendChild(l_node)
   FOR l_i = 1 TO p_attr.getLength()
      LET l_knode = p_resdoc.createElement("key")   
      CALL l_knode.setAttribute("name", p_attr[l_i].name)
      LET l_tnode = p_resdoc.createTextNode(p_attr[l_i].value)
      CALL l_knode.appendChild(l_tnode)
      CALL l_node.appendChild(l_knode)
   END FOR
   
   
   RETURN p_resdoc, l_node
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL cl_wscli_getParamNode(p_response,p_name)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION cl_wscli_getParamNode(p_response,p_name)
   DEFINE p_response              xml.DomDocument
   DEFINE p_name                  STRING             #節點tag名稱
   DEFINE l_nodelist              xml.DomNodeList
   DEFINE l_node                  xml.DomNode
   LET l_nodelist = p_response.getElementsByTagName(p_name)
   LET l_node = l_nodelist.getItem(1)
   RETURN l_node
END FUNCTION
################################################################################
# Descriptions...: 將日期型態中的特殊字元進行處理
# Memo...........:
# Usage..........: CALL cl_wscli_replace_special_char(p_str)
#                  RETURNING l_str
# Input parameter: p_str 含特殊字元的日期字串
# Return code....: l_str 處理後的日期字串
# Date & Author..: 2017/03/17 by nikoybeat
# Modify.........: 170317-00032#1
################################################################################
PRIVATE FUNCTION cl_wscli_replace_special_char(p_str)
   DEFINE p_str         STRING   
   DEFINE l_buf         base.StringBuffer
   DEFINE l_str         STRING
   
   LET l_buf = base.StringBuffer.create()
   CALL l_buf.append(p_str)
   CALL l_buf.replace("-","",0)
   CALL l_buf.replace(":","",0)
   #CALL l_buf.trim()
   LET l_str = l_buf.subString(1,l_buf.getIndexOf(" ", 1) - 1)
   LET l_str = l_str, l_buf.subString(l_buf.getIndexOf(" ", 1) + 1, l_buf.getLength())
   
   RETURN l_str
END FUNCTION

################################################################################
# Descriptions...: 取得response status說明
# Memo...........:
# Usage..........: CALL cl_wscli_getResponseDesc(p_resdoc)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION cl_wscli_getResponseDesc(p_resdoc)
DEFINE p_resdoc  xml.DomDocument
DEFINE l_status  RECORD
        code       STRING,
        desc       STRING,
        sql_code   STRING
        END RECORD
DEFINE l_node_list      xml.DomNodeList
DEFINE l_pnode          xml.DomNode
DEFINE l_tnode          xml.DomNode
DEFINE l_i              INTEGER


    LET l_node_list = p_resdoc.selectByXPath("//" || "status" ,"")
    FOR l_i = 1 TO l_node_list.getCount()
        LET l_pnode = l_node_list.getitem(l_i)
        
        IF NOT cl_null(l_pnode.getAttribute("description")) THEN
           LET l_tnode = l_pnode.getFirstChild()
           
           LET l_status.desc = l_pnode.getNodeValue()
           LET l_status.sql_code = l_pnode.getNodeValue()           
        END IF
          
    END FOR
    
    IF NOT cl_null(l_status.desc) THEN
       RETURN l_status.*
    END IF
END FUNCTION
################################################################################
# Descriptions...: 將日期字串組回Datetime格式
# Memo...........:
# Usage..........: CALL cl_wscli_buildDatetime(p_str)
#                  RETURNING l_str
# Input parameter: p_str 未格式化的日期字串
# Return code....: l_str 格式化的日期字串
# Date & Author..: 2017/03/30 By nikoybeat
# Modify.........: 170317-00032#1
################################################################################
PRIVATE FUNCTION cl_wscli_buildDatetime(p_str)
   DEFINE p_str         STRING   
   DEFINE l_buf         base.StringBuffer
   DEFINE l_str         STRING
   DEFINE l_cnt         INTEGER
   
   LET l_buf = base.StringBuffer.create()
   #date為yyyyMMdd
   CALL l_buf.append(p_str.subString(1,4))
   CALL l_buf.append("-")
   CALL l_buf.append(p_str.subString(5,6))
   CALL l_buf.append("-")
   CALL l_buf.append(p_str.subString(7,8))
   #date為yyyyMMddHHmmss
   IF p_str.getLength() > 8 THEN
      LET l_cnt = 9
      CALL l_buf.append(" ")
      WHILE l_cnt < 14
         CALL l_buf.append(p_str.subString(l_cnt,l_cnt + 1))
         IF l_cnt < 13 THEN
            CALL l_buf.append(":")
         ELSE
            #date為yyyyMMddHHmmssSSS
            IF p_str.getLength() > 14 THEN
               CALL l_buf.append(".")
               CALL l_buf.append(p_str.subString(15,17))
            END IF
         END IF
         LET l_cnt = l_cnt + 2
      END WHILE
   END IF
   
   LET l_str = l_buf.toString()
   
   RETURN l_str
END FUNCTION
################################################################################
# Descriptions...: 預先取得record欄位型別
# Memo...........:
# Usage..........: CALL cl_wscli_buildRecord(p_record)
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2017/06/13 by nikoybeat
# Modify.........: 170522-00034#1
################################################################################
PUBLIC FUNCTION cl_wscli_buildRecord(p_record)
    DEFINE p_record   om.DomNode
    DEFINE l_list1    om.NodeList,
           l_list2    om.NodeList
    DEFINE l_record   om.DomNode,
           l_field    om.DomNode
    DEFINE l_i        INTEGER,
           l_j        INTEGER,
           l_k        INTEGER
    DEFINE l_type     STRING,
           l_name     STRING

    LET l_k = 1
    
    #170626-00040#1 - S
    IF g_input.getLength() > 1 THEN
       LET l_k = g_input.getLength() + 1
    END IF
    #170626-00040#1 - E
    
    LET l_list1 = p_record.selectByTagName("Record")
    FOR l_i = 1 TO l_list1.getLength()
        LET l_record = l_list1.item(l_i)
        LET l_list2 = l_record.selectbyTagName("Field")
        FOR l_j = 1 TO l_list2.getLength()
            INITIALIZE l_name TO NULL
            LET l_field = l_list2.item(l_j)
            LET l_type = l_field.getAttribute("type")
            LET l_name = l_field.getAttribute("name")
            CASE 
            WHEN l_type = "INTEGER"
               LET g_input[l_k].type = "numeric"   
               LET g_input[l_k].name = l_name
            WHEN l_type LIKE "DATE%"
               LET g_input[l_k].type = "date"
               LET g_input[l_k].name = l_name
            OTHERWISE
               LET g_input[l_k].type = "string"
               LET g_input[l_k].name = l_name
            END CASE
            LET l_k = l_k + 1
            
        END FOR
    END FOR
    
    CALL g_input.deleteElement(l_k)  #170626-00040#1
    
END FUNCTION

 
{</section>}
 
