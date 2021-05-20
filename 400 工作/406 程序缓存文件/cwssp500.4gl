#該程式未解開Section, 採用最新樣板產出!
#該程式為freestyle程式!
{<section id="cwssp500.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0008(1900-01-01 00:00:00), PR版次:0008(1900-01-01 00:00:00)
#+ Customerized Version.: SD版次:0001(1900-01-01 00:00:00), PR版次:0008(2020-12-24 16:03:55)
#+ Build......: 000004
#+ Filename...: cwssp500
#+ Description: 
#+ Creator....: XUEXIANG(2019-02-25 15:51:13)
#+ Modifier...: 00000 -SD/PR- 00000
 
{</section>}
 
{<section id="cwssp500.global" type="s" >}
#應用 m00 樣板自動產生(Version:12)
#add-point:填寫註解說明 name="global.memo"
#Memos
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
GLOBALS "../../../erp/cfg/top_finance.inc"    #財務模組使用
DEFINE g_gl_slip          LIKE ooba_t.ooba002      #總帳單別
DEFINE g_ap_slip          LIKE ooba_t.ooba002      #應付帳款單單別
DEFINE g_fin_arg1         LIKE gzsz_t.gzsz002      #財務應用參數(定義於azzi991)D-FIN-3001--應付帳款單性質
DEFINE g_wc_cs_ld         STRING              
DEFINE g_wc_cs_orga       STRING


#end add-point
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
{</section>}
 
{<section id="cwssp500.main" type="s" >}
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
      CALL cwssp500_process()
   END IF
        
   #呼叫服務後置處理程序
   CALL awsp900_01_postprocess()    
 
   #離開作業
   CALL cl_wss_exit()
 
END MAIN
 
{</section>}
 
{<section id="cwssp500.process" type="s" >}
#+ 實際處理服務程式邏輯的FUNCTION內容
PRIVATE FUNCTION cwssp500_process()
   #add-point: 服務邏輯主要處理段的ADP name="cwssp500.process"
   DEFINE g_dfin0031            LIKE type_t.chr1   #C20190307#1 add by zhaoqn    
   DEFINE g_dfin0032            LIKE type_t.chr1   #C20190307#1 add by zhaoqn
   DEFINE l_node         xml.DomNode
   DEFINE l_node1        xml.DomNode 
   DEFINE l_node2        xml.DomNode
   DEFINE l_node3        xml.DomNode
   DEFINE l_node4        xml.DomNode  #add muping170417
   DEFINE l_master       xml.DomNode
   DEFINE l_type         LIKE type_t.chr1
   DEFINE l_str          STRING 
   DEFINE r_success      LIKE type_t.num5
   DEFINE l_apca         RECORD  LIKE apca_t.*
   DEFINE l_apcb         DYNAMIC ARRAY OF RECORD
                   apcbseq LIKE apcb_t.apcbseq, 
                   apcborga LIKE apcb_t.apcborga, 
                   apcb014 LIKE apcb_t.apcb014, 
                   apcb005 LIKE apcb_t.apcb005, 
                   apcb100 LIKE apcb_t.apcb100, 
                   apcb020 LIKE apcb_t.apcb020, 
                   apcb103 LIKE apcb_t.apcb103, 
                   apcb104 LIKE apcb_t.apcb104, 
                   apcb105 LIKE apcb_t.apcb105, 
                   apcb007 LIKE apcb_t.apcb007, 
                   apcb101 LIKE apcb_t.apcb101, 
                   apcb102 LIKE apcb_t.apcb102, 
                   apcb113 LIKE apcb_t.apcb113, 
                   apcb114 LIKE apcb_t.apcb114, 
                   apcb115 LIKE apcb_t.apcb115, 
                   apcb027 LIKE apcb_t.apcb027, 
                   apcb028 LIKE apcb_t.apcb028, 
                   apcb023 LIKE apcb_t.apcb023, 
                   apcb008 LIKE apcb_t.apcb008, 
                   apcb009 LIKE apcb_t.apcb009, 
                   apcb047 LIKE apcb_t.apcb047, 
                   apcb021 LIKE apcb_t.apcb021, 
                   apcb029 LIKE apcb_t.apcb029, 
                   apcb004 LIKE apcb_t.apcb004, 
                   apcb002 LIKE apcb_t.apcb002, 
                   apcb003 LIKE apcb_t.apcb003, 
                   apcb010 LIKE apcb_t.apcb010, 
                   apcb011 LIKE apcb_t.apcb011, 
                   apcblegl LIKE apcb_t.apcblegl, 
                   apcb012 LIKE apcb_t.apcb012, 
                   apcb015 LIKE apcb_t.apcb015, 
                   apcb016 LIKE apcb_t.apcb016, 
                   apcb017 LIKE apcb_t.apcb017, 
                   apcb024 LIKE apcb_t.apcb024, 
                   apcb121 LIKE apcb_t.apcb121, 
                   apcb131 LIKE apcb_t.apcb131, 
                   apcb030 LIKE apcb_t.apcb030, 
                   apcb051 LIKE apcb_t.apcb051,
                   apcb037 LIKE apcb_t.apcb037,
                   apcb038 LIKE apcb_t.apcb038,
                   apcb022 LIKE apcb_t.apcb022,
                   apcb108 LIKE apcb_t.apcb108,
                   apcb118 LIKE apcb_t.apcb118
                         END RECORD
   DEFINE l_isam         DYNAMIC ARRAY OF RECORD
                   isam001 LIKE isam_t.isam001, 
                   isamdocno LIKE isam_t.isamdocno, 
                   isamseq LIKE isam_t.isamseq, 
                   isam008 LIKE isam_t.isam008, 
                   isam037 LIKE isam_t.isam037, 
                   isam011 LIKE isam_t.isam011, 
                   isam010 LIKE isam_t.isam010, 
                   isam030 LIKE isam_t.isam030, 
                   isam009 LIKE isam_t.isam009, 
                   isam012 LIKE isam_t.isam012, 
                   isam0121 LIKE isam_t.isam0121, 
                   isam013 LIKE isam_t.isam013, 
                   isam014 LIKE isam_t.isam014, 
                   isam015 LIKE isam_t.isam015, 
                   isam023 LIKE isam_t.isam023, 
                   isam024 LIKE isam_t.isam024, 
                   isam025 LIKE isam_t.isam025, 
                   isam026 LIKE isam_t.isam026, 
                   isam027 LIKE isam_t.isam027, 
                   isam028 LIKE isam_t.isam028, 
                   isamcomp LIKE isam_t.isamcomp, 
                   isamstus LIKE isam_t.isamstus, 
                   isam002 LIKE isam_t.isam002, 
                   isam004 LIKE isam_t.isam004, 
                   isam016 LIKE isam_t.isam016, 
                   isam017 LIKE isam_t.isam017, 
                   isam018 LIKE isam_t.isam018, 
                   isam019 LIKE isam_t.isam019, 
                   isam020 LIKE isam_t.isam020, 
                   isam021 LIKE isam_t.isam021, 
                   isam022 LIKE isam_t.isam022, 
                   isam029 LIKE isam_t.isam029, 
                   isam031 LIKE isam_t.isam031, 
                   isam032 LIKE isam_t.isam032, 
                   isam033 LIKE isam_t.isam033, 
                   isam034 LIKE isam_t.isam034, 
                   isam038 LIKE isam_t.isam038, 
                   isam039 LIKE isam_t.isam039,
                   isam036    LIKE isam_t.isam036,  
                   isam050    LIKE isam_t.isam050,  
                   isamownid  LIKE isam_t.isamownid,
                   isamowndp  LIKE isam_t.isamowndp,
                   isamcrtid  LIKE isam_t.isamcrtid,
                   isamcrtdp  LIKE isam_t.isamcrtdp,
                   isamcrtdt  LIKE isam_t.isamcrtdt,
                   isammodid  LIKE isam_t.isammodid,
                   isammoddt  LIKE isam_t.isammoddt
                   END RECORD
    DEFINE l_apce        DYNAMIC ARRAY OF RECORD
                   apceseq    LIKE apce_t.apceseq,
                   apce002    LIKE apce_t.apce002,
                   apce003    LIKE apce_t.apce003, 
                   apce004    LIKE apce_t.apce004, 
                   apce005    LIKE apce_t.apce005,  
                   apce100    LIKE apce_t.apce100,
                   apce109    LIKE apce_t.apce109,
                   apce101    LIKE apce_t.apce101,
                   apce119    LIKE apce_t.apce119,
                   apce027    LIKE apce_t.apce027,
                   apce009    LIKE apce_t.apce009,
                   apce015    LIKE apce_t.apce015,
                   apce016    LIKE apce_t.apce016,
                   apce017    LIKE apce_t.apce017,  
                   apce018    LIKE apce_t.apce018,
                   apce019    LIKE apce_t.apce019,
                   apce020    LIKE apce_t.apce020,
                   apce022    LIKE apce_t.apce022,
                   apce023    LIKE apce_t.apce023,
                   apce035    LIKE apce_t.apce035,
                   apce036    LIKE apce_t.apce036,
                   apce044    LIKE apce_t.apce044,
                   apce045    LIKE apce_t.apce045,
                   apce046    LIKE apce_t.apce046,
                   apce051    LIKE apce_t.apce051,
                   apce052    LIKE apce_t.apce052,
                   apce053    LIKE apce_t.apce053,
                   apce054    LIKE apce_t.apce054,
                   apce055    LIKE apce_t.apce055,
                   apce056    LIKE apce_t.apce056,
                   apce057    LIKE apce_t.apce057,
                   apce058    LIKE apce_t.apce058,
                   apce059    LIKE apce_t.apce059,
                   apce060    LIKE apce_t.apce060,
                   apce008    LIKE apce_t.apce008,
                   apce024    LIKE apce_t.apce024,
                   apce025    LIKE apce_t.apce025,
                   apce011    LIKE apce_t.apce011,
                   apce012    LIKE apce_t.apce012,
                   apce026    LIKE apce_t.apce026,
                   apce021    LIKE apce_t.apce021
                      END RECORD
    DEFINE l_apce1 RECORD
                   apce109    LIKE apce_t.apce109,
                   apce119    LIKE apce_t.apce119,
                   apce100    LIKE apce_t.apce100,
                   apce101    LIKE apce_t.apce101
                   END RECORD    
   #add muping170430 s 缴款单身
    DEFINE l_apce2        DYNAMIC ARRAY OF RECORD
     apceseq_b2          LIKE apce_t.apceseq,    
     apce002_b2          LIKE apce_t.apce002,
     apce003_b2          LIKE apce_t.apce003,  #150909 
     apce004_b2          LIKE apce_t.apce004,  #150909 
     apce006_b2          LIKE apce_t.apce006,
     apce100_b2          LIKE apce_t.apce100,
     apce109_b2          LIKE apce_t.apce109,
     apce008_b2          LIKE apce_t.apce008,
     apce101_b2          LIKE apce_t.apce101,
     apce119_b2          LIKE apce_t.apce119,
     apce010_b2          LIKE apce_t.apce010,
     apce015_b2          LIKE apce_t.apce015,
     apce012_b2          LIKE apce_t.apce012,
     apce013_b2          LIKE apce_t.apce013,
     apce016_b2          LIKE apce_t.apce016,
     apce017_b2          LIKE apce_t.apce017,
     apce018_b2          LIKE apce_t.apce018,
     apce019_b2          LIKE apce_t.apce019,
     apce020_b2          LIKE apce_t.apce020,
     apce022_b2          LIKE apce_t.apce022,
     apce023_b2          LIKE apce_t.apce023,
     apce035_b2          LIKE apce_t.apce035,
     apce036_b2          LIKE apce_t.apce036,
     apce044_b2          LIKE apce_t.apce044,
     apce045_b2          LIKE apce_t.apce045,
     apce046_b2          LIKE apce_t.apce046,
     apce051_b2          LIKE apce_t.apce051,
     apce052_b2          LIKE apce_t.apce052,
     apce053_b2          LIKE apce_t.apce053,
     apce054_b2          LIKE apce_t.apce054,
     apce055_b2          LIKE apce_t.apce055,
     apce056_b2          LIKE apce_t.apce056,
     apce057_b2          LIKE apce_t.apce057,
     apce058_b2          LIKE apce_t.apce058,
     apce059_b2          LIKE apce_t.apce059,
     apce060_b2          LIKE apce_t.apce060
       END RECORD   
   #add muping170430 e
  #add muping170417 str
   DEFINE l_apde DYNAMIC ARRAY OF RECORD
                 apdedocno LIKE apde_t.apdedocno, 
                 apdeld LIKE apde_t.apdeld, 
                 apdeseq LIKE apde_t.apdeseq, 
                 apdeorga LIKE apde_t.apdeorga,  
                 apde002 LIKE apde_t.apde002, 
                 apde006 LIKE apde_t.apde006, 
                 apde008 LIKE apde_t.apde008, 
                 apde021 LIKE apde_t.apde021, 
                 apde024 LIKE apde_t.apde024, 
                 apde015 LIKE apde_t.apde015, 
                 apde016 LIKE apde_t.apde016, 
                 apde100 LIKE apde_t.apde100, 
                 apde109 LIKE apde_t.apde109, 
                 apde101 LIKE apde_t.apde101, 
                 apde119 LIKE apde_t.apde119, 
                 apde032 LIKE apde_t.apde032, 
                 apde013 LIKE apde_t.apde013,  
                 apde014 LIKE apde_t.apde014, 
                 apde010 LIKE apde_t.apde010, 
                 apde009 LIKE apde_t.apde009, 
                 apde039 LIKE apde_t.apde039, 
                 apde040 LIKE apde_t.apde040, 
                 apde041 LIKE apde_t.apde041, 
                 apde011 LIKE apde_t.apde011, 
                 apde012 LIKE apde_t.apde012, 
                 apdecomp LIKE apde_t.apdecomp, 
                 apdesite LIKE apde_t.apdesite, 
                 apde001 LIKE apde_t.apde001, 
                 apde038 LIKE apde_t.apde038, 
                 apde061 LIKE apde_t.apde061,
                 apde0022 LIKE type_t.chr10, 
                 apde0152 LIKE type_t.chr1, 
                 apde0162 LIKE type_t.chr500, 
                 apde017 LIKE apde_t.apde017,  
                 apde018 LIKE apde_t.apde018, 
                 apde019 LIKE apde_t.apde019, 
                 apde020 LIKE apde_t.apde020, 
                 apde022 LIKE apde_t.apde022, 
                 apde023 LIKE apde_t.apde023, 
                 apde035 LIKE apde_t.apde035, 
                 apde036 LIKE apde_t.apde036, 
                 apde042 LIKE apde_t.apde042, 
                 apde043 LIKE apde_t.apde043, 
                 apde044 LIKE apde_t.apde044, 
                 apde051 LIKE apde_t.apde051, 
                 apde052 LIKE apde_t.apde052, 
                 apde053 LIKE apde_t.apde053, 
                 apde054 LIKE apde_t.apde054,  
                 apde055 LIKE apde_t.apde055, 
                 apde056 LIKE apde_t.apde056,  
                 apde057 LIKE apde_t.apde057, 
                 apde058 LIKE apde_t.apde058, 
                 apde059 LIKE apde_t.apde059, 
                 apde060 LIKE apde_t.apde060, 
                 apde0023 LIKE type_t.chr10, 
                 apde0063 LIKE type_t.chr10, 
                 apde0083 LIKE type_t.chr20, 
                 apde1003 LIKE type_t.chr10, 
                 apde1093 LIKE type_t.num20_6, 
                 apde1013 LIKE type_t.num26_10, 
                 apde1193 LIKE type_t.num20_6, 
                 apde120 LIKE apde_t.apde120, 
                 apde121 LIKE apde_t.apde121, 
                 apde129 LIKE apde_t.apde129, 
                 apde130 LIKE apde_t.apde130, 
                 apde131 LIKE apde_t.apde131, 
                 apde139 LIKE apde_t.apde139
                 END RECORD
  #add muping170417 end
   DEFINE l_ooib  RECORD
                  ooib025     LIKE ooib_t.ooib025,  #多帳期條件
                  ooib005     LIKE ooib_t.ooib005   #繳款優惠條件
                  END RECORD 
   DEFINE l_return_apca        RECORD               #单头返回值   
                  apcadocno   LIKE apca_t.apcadocno,
                  apca038     LIKE apca_t.apca038,  
                  tran_status LIKE type_t.chr2,     
                  tran_time   LIKE type_t.chr20     
                  END RECORD  
   DEFINE lc_param2            RECORD
                  type        LIKE type_t.chr1,      #類型
                  apca004     LIKE apca_t.apca004,
                  sfin2009    LIKE type_t.chr1       #汇率基本
                 END RECORD
   DEFINE la_param   RECORD
                  prog        STRING,
                  actionid    STRING,
                  background  LIKE type_t.chr1,
                  param       DYNAMIC ARRAY OF STRING
                  END RECORD
   DEFINE  l_ooef004           LIKE ooef_t.ooef004
   DEFINE  l_oodb004           LIKE oodb_t.oodb004  #稅別名稱
   DEFINE  l_oodb005           LIKE oodb_t.oodb005  #含稅否
   DEFINE  l_oodb006           LIKE oodb_t.oodb006  #稅率
   DEFINE  l_oodb011           LIKE oodb_t.oodb011  #稅別應用(1.正常稅率 2.依料件設定)
   DEFINE  l_apcb105           LIKE apcb_t.apcb105
   DEFINE  l_apcb104           LIKE apcb_t.apcb104
   DEFINE  l_apcb123           LIKE apcb_t.apcb123
   DEFINE  l_apcb124           LIKE apcb_t.apcb124
   DEFINE  l_apcb125           LIKE apcb_t.apcb125
   DEFINE  l_apcb133           LIKE apcb_t.apcb133
   DEFINE  l_apcb134           LIKE apcb_t.apcb134
   DEFINE  l_apcb135           LIKE apcb_t.apcb135
   DEFINE l_success2     LIKE type_t.chr1
   DEFINE l_cnt          LIKE type_t.num5
   DEFINE l_cnt1         LIKE type_t.num5
   DEFINE l_cnt2         LIKE type_t.num5
   DEFINE l_cnt3         LIKE type_t.num5
   DEFINE l_cnt4         LIKE type_t.num5  #add muping170417
   DEFINE l_ac           LIKE type_t.num5
   DEFINE l_i            LIKE type_t.num5
   DEFINE l_c            LIKE type_t.num5
   DEFINE l_d            LIKE type_t.num5
   DEFINE l_e            LIKE type_t.num5  #add muping170417
   DEFINE l_amount              RECORD
              apcb103    LIKE apcb_t.apcb103,
              apcb113    LIKE apcb_t.apcb113,
              apcb123    LIKE apcb_t.apcb123,
              apcb133    LIKE apcb_t.apcb133,
              xrcd104    LIKE xrcd_t.xrcd104,
              xrcd114    LIKE xrcd_t.xrcd114,
              xrcd124    LIKE xrcd_t.xrcd124,
              xrcd134    LIKE xrcd_t.xrcd134,
              apca106    LIKE apca_t.apca106,
              apca116    LIKE apca_t.apca116,
              apca126    LIKE apca_t.apca126,
              apca136    LIKE apca_t.apca136,
              apca107    LIKE apca_t.apca107,
              apca117    LIKE apca_t.apca117,
              apca127    LIKE apca_t.apca127,
              apca137    LIKE apca_t.apca137,
              apca108    LIKE apca_t.apca108,
              apca118    LIKE apca_t.apca118,
              apca128    LIKE apca_t.apca128,
              apca138    LIKE apca_t.apca138
                          END RECORD
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
   DEFINE g_glaa001         LIKE glaa_t.glaa001
   DEFINE g_glaa001_1       LIKE glaa_t.glaa001
   DEFINE ls_js             STRING
   DEFINE l_rate2           LIKE fmmp_t.fmmp010 #匯率二
   DEFINE l_rate3           LIKE fmmp_t.fmmp010 #匯率三
   DEFINE l_site            LIKE ooef_t.ooef001
   DEFINE l_ooab002         LIKE ooab_t.ooab002
   DEFINE l_sfin3009        LIKE type_t.chr1 
   DEFINE l_apce048         LIKE apce_t.apce048  
   DEFINE l_apce121         LIKE apce_t.apce121
   DEFINE l_apce131         LIKE apce_t.apce131
   DEFINE l_apce129         LIKE apce_t.apce129
   DEFINE l_apce139         LIKE apce_t.apce139   
   DEFINE l_curr            LIKE type_t.chr10
   DEFINE li_status         LIKE type_t.num5
   DEFINE l_apca100         LIKE apca_t.apca100
   DEFINE l_code            LIKE type_t.chr20
   DEFINE lc_param      RECORD
            apca004     LIKE apca_t.apca004
                    END RECORD
   DEFINE g_apcatype   LIKE type_t.chr5  #add muping170430
   DEFINE g_ap_slip          LIKE ooba_t.ooba002      #應付帳款單單別
   DEFINE g_dfin5002            LIKE type_t.chr1         #新增預算控管
   DEFINE l_apca059_desc        LIKE type_t.chr80  #add muping170506  
   DEFINE l_bgaa008         LIKE bgaa_t.bgaa008    #預算參照表
   DEFINE l_zz              LIKE type_t.num5  #zhouxm170612 add   
   
   LET l_success2 = 'Y'
   CALL cl_auth_user_init() RETURNING li_status
   LET l_cnt = awsp900_01_getMasterRecordLength("apca_t")
   IF l_cnt = 0 THEN
      LET g_status.code = "wss-00002"
      LET g_status.description = cl_getmsg(g_status.code,g_lang)
      RETURN
   END IF
   FOR l_ac = 1 TO l_cnt
      CALL s_fin_create_account_center_tmp()  
      CALL s_aap_create_multi_bill_perod_tmp()
      CALL s_aapp330_cre_tmp() RETURNING g_sub_success
      CALL s_aooi390_cre_tmp_table() RETURNING g_sub_success
      INITIALIZE l_apca.* TO NULL
      LET l_type = awsp900_01_getParameter("processId")   #获取单据类型
      CALL s_transaction_begin()              #开启事务
      LET g_fin_arg1 = 'D-FIN-3001'    #單別參數(帳款單性質)
      #展組織下階成員所需之暫存檔
      CALL s_fin_azzi800_sons_query(g_today)                     
      CALL s_fin_account_center_ld_str() RETURNING g_wc_cs_ld     
      CALL s_fin_get_wc_str(g_wc_cs_ld) RETURNING g_wc_cs_ld      
      CALL s_fin_account_center_sons_str() RETURNING g_wc_cs_orga 
      CALL s_fin_get_wc_str(g_wc_cs_orga) RETURNING g_wc_cs_orga 
      LET l_node = awsp900_01_getMasterRecord(1,'apca_t')

      #默认值####
      LET l_apca.apcaent = g_enterprise                   #企业编号
      LET l_apca.apcastus = 'N'                           #状态码
      LET l_apca.apca001 = "15"                           #账款单性质
      LET l_apca.apca056 = "0"                            #会计检核附件状态
      LET l_apca.apca017 = "0"                            #产生方式
      LET l_apca.apca052 = "0"                            #打印次数
      LET l_apca.apca025 = "0"                            #差异处理(发票与账款差异)
      LET l_apca.apca040 = "N"                            #留置否
      LET l_apca.apca044 = "0"                            #留置原币金额
      LET l_apca.apca101 = "1"                            #原币汇率
      LET l_apca.apca123 = "0"                            #本位币二未税金额
      LET l_apca.apca004 = 'EMPL'                         #账款对象编号  
      LET l_apca.apca005 = 'EMPL'                         #付款对象    
      LET l_apca.apca026 = 0                              #原币未税差异
      LET l_apca.apca027 = 0                              #原币税额差异
      LET l_apca.apca028 = 0                              #本币未税差异
      LET l_apca.apca029 = 0                              #本币币税额差异
      LET l_apca.apca050 = 0                              #附件份数
      LET l_apca.apcacrtdt = cl_get_current()             #数据创建日
      LET l_apca.apcamoddt = cl_get_current()             #最近修改日
      
      
           
      ##########
      LET g_apcatype = awsp900_01_getRecordField(l_node,"apcatype")  #BPM 账款类型 HK :还款
      LET l_apca.apcasite = awsp900_01_getRecordField(l_node,"apcasite")    #账务中心

      LET l_apca.apcadocdt = awsp900_01_getRecordField(l_node,"apcadocdt")  #帳款日期
      LET l_apca.apca003 = awsp900_01_getRecordField(l_node,"apca003")      #账务人员
      
      #str---mark by jixf 190228 挪到下面
      ##请款人员带出账务中心
      #CALL s_fin_ld_carry('',l_apca.apca003) RETURNING g_sub_success,l_apca.apcald,l_apca.apcacomp,g_errno  
      #end---mark by jixf 190228
      
      IF NOT cl_null(g_errno) THEN
         LET g_status.code = g_errno
         LET g_status.description = cl_getmsg(g_status.code,g_lang)
         LET l_success2 = 'N'
         CALL s_transaction_end('N','0')
         EXIT FOR
      END IF
      LET l_apca.apca014 = awsp900_01_getRecordField(l_node,"apca014")      #请款人员
      LET l_apca.apca015 = awsp900_01_getRecordField(l_node,"apca015")      #部门编号
      LET l_apca.apca007 = awsp900_01_getRecordField(l_node,"apca007")      #账款类别
      LET l_apca.apca053 = awsp900_01_getRecordField(l_node,"apca053")      #备注
      LET l_apca.apca057 = awsp900_01_getRecordField(l_node,"apca057")      #交易对象识别码
      LET l_apca.apca018 = awsp900_01_getRecordField(l_node,"apca018")      #来源参考单号 
      LET l_apca.apca050 = awsp900_01_getRecordField(l_node,"apca050")      #附件份数  #zhouxm170613 add 
      LET l_apca.apcald  = awsp900_01_getRecordField(l_node,"apcald")       #add by jixf 190228 增加账套取值    
      #str---add by jixf 190228
      #请款人员带出账务中心
      CALL s_fin_ld_carry(l_apca.apcald,l_apca.apca003) RETURNING g_sub_success,l_apca.apcald,l_apca.apcacomp,g_errno 
      #end---add by jixf 190228
      
      #请款人员检核
      CALL s_employee_chk(l_apca.apca014)RETURNING g_sub_success
      IF NOT g_sub_success THEN
         LET g_status.code = g_errno
         LET g_status.description = cl_getmsg(g_status.code,g_lang)
         LET l_success2 = 'N'
         CALL s_transaction_end('N','0')
         EXIT FOR
      END IF
      LET g_user = l_apca.apca014#add muping170427
      #请款人员带出部门
      IF cl_null(l_apca.apca015) THEN 
          SELECT ooag003 INTO l_apca.apca015 FROM ooag_t 
           WHERE ooagent = g_enterprise AND ooag001 = l_apca.apca014
      END IF 
      CALL  s_department_chk(l_apca.apca015,l_apca.apcadocdt) RETURNING g_sub_success
      IF NOT g_sub_success THEN
         LET g_status.code = g_errno
         LET g_status.description = cl_getmsg(g_status.code,g_lang)
         LET l_success2 = 'N'
         CALL s_transaction_end('N','0')
         EXIT FOR
      END IF
      

      
      IF NOT cl_null(l_apca.apcald)THEN
         INITIALIZE g_glaa.* TO NULL
         SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,
                glaald,glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,
                glaa010,glaa011,glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,
                glaa021,glaa022,glaa023,glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,
                glaa112,glaa113,glaa120,glaa121,glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,
                glaa135,glaa136,glaa137,glaa138,glaa139,glaa140,glaa123,glaa124,glaa028 INTO g_glaa.*          

         FROM glaa_t
          WHERE glaaent=g_enterprise AND glaald=l_apca.apcald
            AND glaa014 = 'Y' 
         IF NOT cl_null(g_glaa.glaa015) AND g_glaa.glaa015 = 'Y' THEN
            LET l_apca.apca120 = g_glaa.glaa016
         END IF
         IF NOT cl_null(g_glaa.glaa019)THEN
            LET l_apca.apca130 = g_glaa.glaa020
         END IF
      END IF
      
      IF cl_null(l_apca.apca057) THEN 
          LET l_apca.apca057 =  l_apca.apca014                                  #交易对象识别码 
      END IF           
      LET l_apca.apcaownid = l_apca.apca014
      LET l_apca.apcaowndp = l_apca.apca015
      LET l_apca.apcacrtid = l_apca.apca014
      LET l_apca.apcacrtdp = l_apca.apca015      
      LET l_apca.apcamodid = l_apca.apca014
      
      #由帳款對象带出apca008
      CALL s_apmm101_sel_pmab(l_apca.apcacomp,l_apca.apca004,"pmab037")
           RETURNING g_sub_success,g_errno,l_apca.apca008
      IF NOT g_sub_success THEN
         LET g_status.code = g_errno
         LET g_status.description = cl_getmsg(g_status.code,g_lang)
         LET l_success2 = 'N'
         CALL s_transaction_end('N','0')
         EXIT FOR
      END IF
      #账务中心抓默认单别 
#zhouxm170612 mark start      
#      SELECT  ooef004 INTO l_ooef004 FROM ooef_t 
#         WHERE ooefent = l_apca.apcaent  
#         AND ooef001 =l_apca.apcasite 
#      SELECT rtai004 INTO l_apca.apcadocno FROM rtai_t 
#          WHERE rtaient = l_apca.apcaent
#          AND rtai001 = l_ooef004
#          AND rtai003 = 'aapt330'
#      IF cl_null(l_apca.apcadocno) THEN
#         LET g_status.code = '-1'
#         LET g_status.description = "没有获取到单别,请检查arti200"
#         LET l_success2 = 'N'
#         CALL s_transaction_end('N','0')
#         EXIT FOR
#       END IF
#zhouxm170612 mark end
#zhouxm170612 add start
       LET l_apca.apcadocno = awsp900_01_getRecordField(l_node,"apcadocno")      #单别
       LET l_zz = 0 
#mark by xujw171117--begin--
       #SELECT count(*) INTO l_zz FROM ooba_t
       #WHERE oobaent=g_enterprise AND ooba001='MN60'
       #  AND ooba002=l_apca.apcadocno
#mark by xujw171117--end--
#add by xujw171117--begin--
       SELECT count(*) INTO l_zz FROM ooba_t,ooef_t
        WHERE oobaent = ooefent 
          AND oobaent = g_enterprise
          AND ooba001 = ooef004
          AND ooef001 = g_site
          AND ooba002 = l_apca.apcadocno
#add by xujw171117--end--
       IF l_zz = 0 THEN
          LET g_status.code = '-1'
          LET g_status.description = "单别不存在，请检查是否存在于aooi200"
          LET l_success2 = 'N'
          CALL s_transaction_end('N','0')
          EXIT FOR       
       END IF        
#zhouxm170612 add end 

       #add muping170506 str根据单别带出预算编号 
       CALL s_aap_get_bgaf004(l_apca.apcald,l_apca.apcacomp,l_apca.apcadocno,l_apca.apcadocdt) 
       RETURNING l_apca.apca059,l_apca059_desc       
       #add muping170506 end
      #帐款类型带出apca035 
       CALL s_fin_get_account(l_apca.apcald,'13',l_apca.apca007,'8504_21')
        RETURNING g_sub_success,l_apca.apca035,g_errno
       IF NOT g_sub_success THEN
         LET g_status.code = g_errno
         LET g_status.description = cl_getmsg(g_status.code,g_lang)
         LET l_success2 = 'N'
         CALL s_transaction_end('N','0')
         EXIT FOR
       END IF        

      #账款类别检核
      IF NOT cl_null(l_apca.apca007)THEN
         IF NOT s_azzi650_chk_exist('3211',l_apca.apca007) THEN
            IF NOT g_sub_success THEN
               LET g_status.code = g_errno
               LET g_status.description = cl_getmsg(g_status.code,g_lang)
               LET l_success2 = 'N'
               CALL s_transaction_end('N','0')
               EXIT FOR
            END IF
         END IF 
       END IF
       
      
      #应付会计科目检核
      CALL s_aap_glac002_chk(l_apca.apca035,l_apca.apcald) RETURNING g_sub_success,g_errno
      IF NOT g_sub_success THEN
         LET g_status.code = g_errno
         LET g_status.description = cl_getmsg(g_status.code,g_lang)
         LET l_success2 = 'N'
         CALL s_transaction_end('N','0')
         EXIT FOR
      END IF
      
      #付款条件带出應付款日 票到期日
      IF NOT cl_null(l_apca.apca008) AND NOT cl_null(l_apca.apca004) 
         AND NOT cl_null(l_apca.apcacomp) AND NOT cl_null(l_apca.apcadocdt)THEN
         CALL s_fin_date_ap_payable(l_apca.apcacomp,l_apca.apca004,l_apca.apca008,l_apca.apcadocdt,
            l_apca.apcadocdt,l_apca.apcadocdt,'') RETURNING g_sub_success,l_apca.apca009,l_apca.apca010
         IF NOT g_sub_success THEN
            LET g_status.code = g_errno
            LET g_status.description = cl_getmsg(g_status.code,g_lang)
            LET l_success2 = 'N'
            CALL s_transaction_end('N','0')
            EXIT FOR
         END IF
      END IF
      
      #付款條件帶出多帳期條件繳款條件
      INITIALIZE l_ooib.* TO NULL
      SELECT ooib025,ooib005 INTO l_ooib.ooib025,l_ooib.ooib005 FROM ooib_t
       WHERE ooibent = l_apca.apcaent
         AND ooib002 = l_apca.apca008
      LET l_apca.apca055 = l_ooib.ooib005
      IF NOT cl_null(l_apca.apca055) THEN
         CALL s_aap_ooid001_chk(l_apca.apca055) RETURNING g_sub_success,g_errno
         IF NOT g_sub_success THEN
            LET g_status.code = g_errno
            LET g_status.description = cl_getmsg(g_status.code,g_lang)
            LET l_success2 = 'N'
            CALL s_transaction_end('N','0')
            EXIT FOR
         END IF
      END IF
      
      CALL s_fin_ld_carry(l_apca.apcald,l_apca.apca014)RETURNING g_sub_success,l_apca.apcald,l_apca.apcacomp,g_errno  #法人
      IF NOT g_sub_success THEN
         LET g_status.code = g_errno
         LET g_status.description = cl_getmsg(g_status.code,g_lang)
         LET l_success2 = 'N'
         CALL s_transaction_end('N','0')
         EXIT FOR
      END IF
      SELECT glaa001 INTO g_glaa001
           FROM glaa_t
          WHERE glaaent  = g_enterprise
            AND glaacomp = l_apca.apcacomp
            AND glaa014  = 'Y'
      SELECT ooeg004 INTO l_apca.apca034 FROM ooeg_t
       WHERE ooeg001 = l_apca.apca015
         AND ooegent = l_apca.apcaent      
      LET l_apca.apca100 = g_glaa001

      #单据自动编号
      CALL s_aooi200_fin_gen_docno(l_apca.apcald,'','',l_apca.apcadocno,l_apca.apcadocdt,'aapt330') 
         RETURNING g_sub_success,l_apca.apcadocno
         IF NOT g_sub_success THEN
            LET g_status.code = 'apm-00003'
            LET g_status.description = cl_getmsg(g_status.code,g_lang)
            LET l_success2 = 'N'
            CALL s_transaction_end('N','0')
            EXIT FOR
         END IF
      #插入表
      INSERT INTO apca_t (apcaent,apcasite,apcald,apcacomp,apcadocno,apcadocdt,apca014,apca015, 
                   apca057,apca037,apca004,apca005,apca001,apca054,apca055,apcastus,apca007,apca003, 
                   apca036,apca035,apca008,apca009,apca010,apca118,apca117,apca116,apca113,apca050,apca053, 
                   apca034,apca059,apca039,apca056,apca038,apca016,apca018,apca019,apca063,apca017,apca052, 
                   apca051,apca025,apca031,apca030,apca026,apca027,apca028,apca029,apca040,apca042,apca041, 
                   apca044,apca045,apca043,apca101,apca120,apca121,apca123,apca127,apca128,apca126,apca130, 
                   apca131,apca137,apca136,apca138,apca133,apcaownid,apcaowndp,apcacrtid,apcacrtdp,apcacrtdt, 
                   apcamodid,apcamoddt,apcacnfid,apcacnfdt,apca100)
               VALUES (g_enterprise,l_apca.apcasite,l_apca.apcald,l_apca.apcacomp,l_apca.apcadocno, 
                   l_apca.apcadocdt,l_apca.apca014,l_apca.apca015,l_apca.apca057,l_apca.apca037, 
                   l_apca.apca004,l_apca.apca005,l_apca.apca001,l_apca.apca054,l_apca.apca055, 
                   l_apca.apcastus,l_apca.apca007,l_apca.apca003,l_apca.apca036,l_apca.apca035, 
                   l_apca.apca008,l_apca.apca009,l_apca.apca010,l_apca.apca118,l_apca.apca117, 
                   l_apca.apca116,l_apca.apca113,l_apca.apca050,l_apca.apca053,l_apca.apca034, 
                   l_apca.apca059,l_apca.apca039,l_apca.apca056,l_apca.apca038,l_apca.apca016, 
                   l_apca.apca018,l_apca.apca019,l_apca.apca063,l_apca.apca017,l_apca.apca052, 
                   l_apca.apca051,l_apca.apca025,l_apca.apca031,l_apca.apca030,l_apca.apca026, 
                   l_apca.apca027,l_apca.apca028,l_apca.apca029,l_apca.apca040,l_apca.apca042, 
                   l_apca.apca041,l_apca.apca044,l_apca.apca045,l_apca.apca043,l_apca.apca101, 
                   l_apca.apca120,l_apca.apca121,l_apca.apca123,l_apca.apca127,l_apca.apca128, 
                   l_apca.apca126,l_apca.apca130,l_apca.apca131,l_apca.apca137,l_apca.apca136, 
                   l_apca.apca138,l_apca.apca133,l_apca.apcaownid,l_apca.apcaowndp,l_apca.apcacrtid, 
                   l_apca.apcacrtdp,l_apca.apcacrtdt,l_apca.apcamodid,l_apca.apcamoddt,l_apca.apcacnfid, 
                   l_apca.apcacnfdt,l_apca.apca100) 
                   IF SQLCA.sqlcode THEN
                      LET l_success2 = 'N'
                      LET g_status.code = SQLCA.sqlcode
                      LET g_status.description = cl_getmsg(g_status.code,g_lang)
                      CALL s_transaction_end('N','0')
                      EXIT FOR
                   END IF
                   
      ######apcb单身档资料处理####     
      IF l_success2 ='Y' THEN #  add by lixwz201103     
      LET l_cnt1 = awsp900_01_getDetailRecordLength(l_node,'apcb_t')
      FOR l_i = 1 TO l_cnt1 
          LET l_node1 = awsp900_01_getDetailRecord(l_node,l_i,'apcb_t')
          #冲暂估单否
          LET l_apcb[l_i].apcb023 = "N"
          #正负值         
          LET l_apcb[l_i].apcb022 = 1
          #本币含税金额
          LET l_apcb[l_i].apcb115 = 0 
          #交易原币单价
          LET l_apcb[l_i].apcb101 = 0
          #计价数量
          LET l_apcb[l_i].apcb007 = 1 

          #項次
          SELECT MAX(apcbseq)+1 INTO l_apcb[l_i].apcbseq FROM apcb_t
           WHERE apcbent = l_apca.apcaent AND apcbdocno = l_apca.apcadocno
          IF cl_null(l_apcb[l_i].apcbseq) OR l_apcb[l_i].apcbseq = 0 THEN
             LET l_apcb[l_i].apcbseq = 1
          END IF  
          LET l_apcb[l_i].apcborga = l_apca.apcacomp
          
         #幣別預設
         SELECT glaa001 INTO g_glaa001
           FROM glaa_t
          WHERE glaaent  = g_enterprise
            AND glaacomp = l_apca.apcacomp
            AND glaa014  = 'Y'
          LET l_apcb[l_i].apcb100 = g_glaa001  
          #人員
          LET l_apcb[l_i].apcb051 = l_apca.apca057  
          #部門
          #LET l_apcb[l_i].apcb010 = l_apca.apca015
          #責任中心
          LET l_apcb[l_i].apcb011 = l_apca.apca034
          #會計科目
          IF NOT cl_null(l_apca.apca036) THEN LET l_apcb[l_i].apcb021 = l_apca.apca036 END IF            
          #付款条件
          LET l_apcb[l_i].apcb030 = l_apca.apca008
          #应付会计科目
          LET l_apcb[l_i].apcb029 = l_apca.apca035
          #科目检核
          CALL s_aap_glac002_chk(l_apcb[l_i].apcb029,l_apca.apcald) RETURNING g_sub_success,g_errno
          IF NOT g_sub_success THEN
             LET g_status.code = g_errno
             LET g_status.description = cl_getmsg(g_status.code,g_lang)
             LET l_success2 = 'N'
             CALL s_transaction_end('N','0')
             EXIT FOR
          END IF
          #币别代号
          LET l_apcb[l_i].apcb100  = awsp900_01_getRecordField(l_node1,"apcb100")
          CALL s_aap_ooaj001_chk(l_apca.apcald,l_apcb[l_i].apcb100) RETURNING g_sub_success,g_errno
          IF NOT g_sub_success THEN
             LET g_status.code = g_errno
             LET g_status.description = cl_getmsg(g_status.code,g_lang)
             LET l_success2 = 'N'
             CALL s_transaction_end('N','0')
             EXIT FOR
          END IF
          #add muping170506 str
          #部门
          LET l_apcb[l_i].apcb010  = awsp900_01_getRecordField(l_node1,"apcb010")
          IF cl_null(l_apcb[l_i].apcb010) AND NOT cl_null(l_apca.apca015) THEN
            LET l_apcb[l_i].apcb010 = l_apca.apca015
          END IF
          #add muping170506 end
          #税种代号
          LET l_apcb[l_i].apcb020  = awsp900_01_getRecordField(l_node1,"apcb020")
          #未税金额  
          LET l_apcb[l_i].apcb103  = awsp900_01_getRecordField(l_node1,"apcb103")
          #税额  
          LET l_apcb[l_i].apcb104  = awsp900_01_getRecordField(l_node1,"apcb104") 
          #报销金额 
          LET l_apcb[l_i].apcb105  = awsp900_01_getRecordField(l_node1,"apcb105")  
          #摘要
          LET l_apcb[l_i].apcb047  = awsp900_01_getRecordField(l_node1,"apcb047")  
          #科目
          LET l_apcb[l_i].apcb021  = awsp900_01_getRecordField(l_node1,"apcb021") 
          #科目检核
          CALL s_aap_glac002_chk(l_apcb[l_i].apcb021,l_apca.apcald) RETURNING g_sub_success,g_errno
          IF NOT g_sub_success THEN
             LET g_status.code = g_errno
             LET g_status.description = cl_getmsg(g_status.code,g_lang)
             LET l_success2 = 'N'
             CALL s_transaction_end('N','0')
             EXIT FOR
          END IF
          #add muping170506 str
          #檢查是否適用預算科目 
          CALL s_aooi200_fin_get_slip(l_apca.apcadocno) RETURNING g_sub_success,g_ap_slip
          CALL s_fin_get_doc_para(l_apca.apcald,l_apca.apcacomp,g_ap_slip,'D-FIN-5002') RETURNING g_dfin5002
          IF g_dfin5002 = 'Y' THEN                
             #取得預算細項參照表                     
             SELECT bgaa008 INTO l_bgaa008  FROM bgaa_t
              WHERE bgaaent = g_enterprise  AND  bgaa001 = l_apca.apca059
             #取得會計科目所對應的預算細項 
             LET l_apcb[l_i].apcb017  = ''
             SELECT bgao004 INTO l_apcb[l_i].apcb017 
               FROM bgao_t
              WHERE bgao001 = l_bgaa008       AND bgaoent = g_enterprise
                AND bgao002 = g_glaa.glaa004  AND bgao003 = l_apcb[l_i].apcb021
             #預算細項說明    
#             SELECT bgael003 INTO l_apcb[l_i].apcb017_desc 
#               FROM bgael_t 
#              WHERE bgaelent = g_enterprise           AND bgael006 = l_bgaa008  
#                AND bgael001 = l_apcb[l_i].apcb017 AND bgael002 = g_dlang
             #檢核預算細項是否可被使用(abgi100)    
             CALL s_abg_bgai_chk(l_apca.apca059,l_apca.apcacomp,l_apcb[l_i].apcb017)
                RETURNING g_sub_success,g_errno                      
             IF NOT g_sub_success THEN                         
                LET g_status.code = g_errno
                LET g_status.description = cl_getmsg(g_status.code,g_lang)
                LET l_success2 = 'N'
                CALL s_transaction_end('N','0')
                EXIT FOR
             END IF
          END IF
          #add muping170506 end
          #由币种带出汇率
          IF NOT cl_null(l_apcb[l_i].apcb100) THEN 
             CALL s_ld_sel_glaa(l_apca.apcald,'glaa001') RETURNING  g_sub_success,g_glaa001_1 
             CALL cl_get_para(g_enterprise,l_apca.apcacomp,'S-BAS-0014') RETURNING l_ooab002
             CALL cl_get_para(g_enterprise,l_apca.apcacomp,'S-FIN-3009') RETURNING l_sfin3009
             CASE l_sfin3009
               WHEN '1'  #依立帳日匯率(aooi160)
                  CALL s_aooi160_get_exrate('2',l_apca.apcald,l_apca.apcadocdt,l_apcb[l_i].apcb100,g_glaa001_1,0,l_ooab002)
                     RETURNING l_apcb[l_i].apcb102
               WHEN '2'  #依立帳日月平均匯率(aooi170)
                  CALL s_aooi160_get_exrate_avg('2',l_apca.apcald,l_apca.apcadocdt,l_apcb[l_i].apcb100,g_glaa001_1,0,l_ooab002)
                     RETURNING g_sub_success,g_errno,l_apcb[l_i].apcb102
             END CASE
          END IF 
          
          #交易税明细
          IF NOT cl_null(l_apcb[l_i].apcb020) THEN
             CALL s_tax_chk(l_apca.apcacomp,l_apcb[l_i].apcb020) 
                    RETURNING g_sub_success,l_oodb004,l_oodb005,l_oodb006,l_oodb011
             IF NOT g_sub_success THEN
                LET g_status.code = g_errno
                LET g_status.description = cl_getmsg(g_status.code,g_lang)
                LET l_success2 = 'N'
                CALL s_transaction_end('N','0')
                EXIT FOR
             END IF
             IF l_oodb005 = 'Y' THEN   
                LET g_sys = 'AAP'
                CALL s_tax_ins(l_apca.apcadocno,l_apcb[l_i].apcbseq,'0',l_apcb[l_i].apcborga,l_apcb[l_i].apcb105,
                               l_apcb[l_i].apcb020,'1',l_apcb[l_i].apcb100,
                               l_apcb[l_i].apcb102,l_apca.apcald,'1','1')
                     RETURNING l_apcb[l_i].apcb103,l_apcb[l_i].apcb104,l_apcb[l_i].apcb105,
                               l_apcb[l_i].apcb113,l_apcb[l_i].apcb114,l_apcb[l_i].apcb115,
                               l_apcb123,l_apcb124,l_apcb125,
                               l_apcb133,l_apcb134,l_apcb135
                LET g_sys = 'WSS'
             ELSE
                LET l_apcb[l_i].apcb104 = l_apcb[l_i].apcb105 - l_apcb[l_i].apcb103
                LET l_apcb[l_i].apcb113 = l_apcb[l_i].apcb103 * l_apcb[l_i].apcb102 #zhouxm170724 add
                LET l_apcb[l_i].apcb115 = l_apcb[l_i].apcb105 * l_apcb[l_i].apcb102
                LET l_apcb[l_i].apcb115 = s_curr_round(l_apca.apcasite,g_glaa001,l_apcb[l_i].apcb115,2)
                LET l_apcb[l_i].apcb114 = l_apcb[l_i].apcb115 - l_apcb[l_i].apcb113                       
           
                UPDATE xrcd_t SET xrcd103 = l_apcb[l_i].apcb103,
                                  xrcd104 = l_apcb[l_i].apcb104,
                                  xrcd105 = l_apcb[l_i].apcb105,
                                  xrcd113 = l_apcb[l_i].apcb113,
                                  xrcd114 = l_apcb[l_i].apcb114,
                                  xrcd115 = l_apcb[l_i].apcb115
                 WHERE xrcdent   = g_enterprise
                    AND xrcddocno = l_apca.apcadocno
                    AND xrcdseq   = l_apcb[l_i].apcbseq
                    AND xrcdld    = l_apca.apcald 
                IF SQLCA.sqlcode THEN
                   LET l_success2 = 'N'
                   LET g_status.code = SQLCA.sqlcode
                   LET g_status.description = cl_getmsg(g_status.code,g_lang)
                   CALL s_transaction_end('N','0')
                   EXIT FOR
                 END IF
              END IF
          END IF 
          LET l_apcb[l_i].apcb101 = l_apcb[l_i].apcb105
          LET l_apcb[l_i].apcb108 = l_apcb[l_i].apcb105
          LET l_apcb[l_i].apcb118 = l_apcb[l_i].apcb115
          INSERT INTO apcb_t
                  (apcbent,
                   apcbld,apcbdocno,apcbseq,
                   apcborga,apcb014,apcb005,apcb100,apcb020,apcb103,apcb104,apcb105,apcb007,
                   apcb101,apcb102,apcb113,apcb114,apcb115,apcb027,apcb028,apcb023,apcb008,
                   apcb009,apcb047,apcb021,apcb029,apcb004,apcb002,apcb003,apcb010,apcb011,
                   apcblegl,apcb012,apcb015,apcb016,apcb017,apcb024,apcb121,apcb131,apcb030,
                   apcb051,apcb038,apcb022,apcb108,apcb118,apcb037) 
            VALUES(g_enterprise,
                   l_apca.apcald,l_apca.apcadocno,l_apcb[l_i].apcbseq,
                   l_apcb[l_i].apcborga,l_apcb[l_i].apcb014,l_apcb[l_i].apcb005, 
                       l_apcb[l_i].apcb100,l_apcb[l_i].apcb020,l_apcb[l_i].apcb103, 
                       l_apcb[l_i].apcb104,l_apcb[l_i].apcb105,l_apcb[l_i].apcb007, 
                       l_apcb[l_i].apcb101,l_apcb[l_i].apcb102,l_apcb[l_i].apcb113, 
                       l_apcb[l_i].apcb114,l_apcb[l_i].apcb115,l_apcb[l_i].apcb027, 
                       l_apcb[l_i].apcb028,l_apcb[l_i].apcb023,l_apcb[l_i].apcb008, 
                       l_apcb[l_i].apcb009,l_apcb[l_i].apcb047,l_apcb[l_i].apcb021, 
                       l_apcb[l_i].apcb029,l_apcb[l_i].apcb004,l_apcb[l_i].apcb002, 
                       l_apcb[l_i].apcb003,l_apcb[l_i].apcb010,l_apcb[l_i].apcb011, 
                       l_apcb[l_i].apcblegl,l_apcb[l_i].apcb012,l_apcb[l_i].apcb015, 
                       l_apcb[l_i].apcb016,l_apcb[l_i].apcb017,l_apcb[l_i].apcb024, 
                       l_apcb[l_i].apcb121,l_apcb[l_i].apcb131,l_apcb[l_i].apcb030, 
                       l_apcb[l_i].apcb051,l_apcb[l_i].apcb038,l_apcb[l_i].apcb022,
                       l_apcb[l_i].apcb108,l_apcb[l_i].apcb118,l_apcb[l_i].apcb037)
          IF SQLCA.sqlcode THEN
             LET l_success2 = 'N'
             LET g_status.code = SQLCA.sqlcode
             LET g_status.description = cl_getmsg(g_status.code,g_lang)
             CALL s_transaction_end('N','0')
             EXIT FOR
          END IF
          
          #预算
          ##add muping170501 str
          CALL s_aooi200_fin_get_slip(l_apca.apcadocno) RETURNING g_sub_success,g_ap_slip #单别
          CALL s_fin_get_doc_para(l_apca.apcald,l_apca.apcacomp,g_ap_slip,'D-FIN-5002') RETURNING g_dfin5002
          IF g_dfin5002 = 'Y' THEN
            #檢核預算滾動檔是否存在
             CALL s_aapt300_bgbd_upd(l_apca.apcadocno,l_apca.apcald,l_apcb[l_i].apcbseq,'','4')
                       RETURNING g_sub_success,g_errno                                                 
             IF g_sub_success THEN                   
                CALL s_aapt300_bgbd_upd(l_apca.apcadocno,l_apca.apcald,l_apcb[l_i].apcbseq,'','2')
                    RETURNING g_sub_success,g_errno        #預算額度是否超過
                IF NOT g_sub_success THEN
                   LET g_status.code = g_errno
                   LET g_status.description = cl_getmsg(g_status.code,g_lang)
                   LET l_success2 = 'N'
                   CALL s_transaction_end('N','0')
                   EXIT FOR
                END IF      
                #新增一筆bgbd_t               
                CALL s_aapt300_bgbd_upd(l_apca.apcadocno,l_apca.apcald,l_apcb[l_i].apcbseq,'I','3')
                   RETURNING g_sub_success,g_errno
                IF NOT g_sub_success THEN
                   LET g_status.code = g_errno
                   LET g_status.description = cl_getmsg(g_status.code,g_lang)
                   LET l_success2 = 'N'
                   CALL s_transaction_end('N','0')
                   EXIT FOR
                END IF    
             END IF 
          END IF           
          ##add muping170501 end
      END FOR
      END IF #  add by lixwz201103     
      #发票明细
      IF l_success2 ='Y' THEN #  add by lixwz201103     
      LET l_cnt2 = awsp900_01_getDetailRecordLength(l_node,'isam_t')
      FOR l_d = 1 TO l_cnt2 #单身
         #取得参数值
          
          LET l_node2 = awsp900_01_getDetailRecord(l_node,l_d,'isam_t')
          LET l_isam[l_d].isam010 = awsp900_01_getRecordField(l_node2,"isam010")  #发票号码
          LET l_isam[l_d].isam011 = awsp900_01_getRecordField(l_node2,"isam011")  #发票日期
          #項次
          SELECT MAX(isamseq)+1 INTO l_isam[l_d].isamseq FROM isam_t
           WHERE isament = l_apca.apcaent AND isamdocno = l_apca.apcadocno
          IF cl_null(l_isam[l_d].isamseq) OR l_isam[l_d].isamseq = 0 THEN
             LET l_isam[l_d].isamseq = 1
          END IF  
         LET l_isam[l_d].isam036   = '11'
         LET l_isam[l_d].isam050   = l_apca.apcadocno         
         LET l_isam[l_d].isamownid = l_apca.apca014
         LET l_isam[l_d].isamowndp = l_apca.apca015
         LET l_isam[l_d].isamcrtid = l_apca.apca014
         LET l_isam[l_d].isamcrtdp = l_apca.apca015
         LET l_isam[l_d].isamcrtdt = cl_get_current() 
         LET l_isam[l_d].isammodid = l_apca.apca014
         LET l_isam[l_d].isammoddt = cl_get_current()
         

         LET l_isam[l_d].isamcomp  = l_apca.apcacomp
         LET l_isam[l_d].isamstus  = 'Y'
         LET l_isam[l_d].isamdocno = l_apca.apcadocno
         LET l_isam[l_d].isam001   = 'aapt30'
         LET l_isam[l_d].isam002 = l_apca.apca004
         LET l_isam[l_d].isam004 = l_apca.apca015
         IF cl_null(l_apca.apcadocdt ) THEN 
            LET l_apca.apcadocdt  = g_today
         END IF

         LET l_isam[l_d].isam012 = l_apca.apca011
         LET l_isam[l_d].isam0121= l_apca.apca013
         LET l_isam[l_d].isam013 = l_apca.apca012
         #LET l_isam[l_d].isam038 = 0
         #LET l_isam[l_d].isam039 = 1              
          LET l_isam[l_d].isam037 = '1'  #可扣抵代码
          LET l_isam[l_d].isam008 = '01' #发票类型
          LET l_isam[l_d].isam012 = awsp900_01_getRecordField(l_node2,"isam012") #税别 JX17
          LET l_isam[l_d].isam014 = awsp900_01_getRecordField(l_node2,"isam014") #币别 CNY
          CALL s_aap_ooaj001_chk(l_apca.apcald,l_isam[l_d].isam014) RETURNING g_sub_success,g_errno
          IF NOT g_sub_success THEN
             LET g_status.code = g_errno
             LET g_status.description = cl_getmsg(g_status.code,g_lang)
             LET l_success2 = 'N'
             CALL s_transaction_end('N','0')
             EXIT FOR
          END IF
          
          LET lc_param2.apca004 = l_apca.apca004
          CALL cl_get_para(g_enterprise,l_apca.apcacomp,'S-FIN-3009') RETURNING lc_param2.sfin2009 
          LET ls_js = util.JSON.stringify(lc_param2)
          
          CALL s_fin_get_curr_rate(l_isam[l_d].isamcomp,l_apca.apcald,l_apca.apcadocdt,l_isam[l_d].isam014,ls_js)
            RETURNING l_isam[l_d].isam015,l_rate2,l_rate3
          LET l_isam[l_d].isam025 = awsp900_01_getRecordField(l_node2,"isam025") #原币含税金额
          #税
          SELECT DISTINCT oodb005,oodb006
           INTO l_isam[l_d].isam0121,l_isam[l_d].isam013
           FROM ooef_T, oodb_T
          WHERE ooefent = oodbent
            AND ooef019 = oodb001
            AND ooefent = 10
            AND ooef019 = '01'
            AND oodb002 = l_isam[l_d].isam012
            AND ((oodb004 = '1' AND oodb003 = 'T01') OR (oodb004 <> '1'))
            AND oodbstus = 'Y'
          SELECT glaa001 INTO g_glaa001
           FROM glaa_t
          WHERE glaaent  = g_enterprise
            AND glaacomp = l_apca.apcacomp
            AND glaa014  = 'Y'
          #金额的计算
          IF l_isam[l_d].isam0121 = 'Y' THEN
             CALL s_tax_count(l_apca.apcacomp,l_isam[l_d].isam012,l_isam[l_d].isam025,1,l_isam[l_d].isam014,l_isam[l_d].isam015)    
                 RETURNING l_isam[l_d].isam023,l_isam[l_d].isam024,l_isam[l_d].isam025
                          ,l_isam[l_d].isam026,l_isam[l_d].isam027,l_isam[l_d].isam028
          ELSE
             LET l_isam[l_d].isam024 = l_isam[l_d].isam025 - l_isam[l_d].isam023
             IF l_isam[l_d].isam015 = 1 THEN
                LET l_isam[l_d].isam028 = l_isam[l_d].isam025
                LET l_isam[l_d].isam027 = l_isam[l_d].isam024
              ELSE
                LET l_isam[l_d].isam028 = l_isam[l_d].isam025 * l_isam[l_d].isam015
                CALL s_curr_round_ld('1',l_apca.apcald,g_glaa001,l_isam[l_d].isam028,2) 
                        RETURNING g_sub_success,g_errno,l_isam[l_d].isam028
                IF NOT g_sub_success THEN
                   LET g_status.code = g_errno
                   LET g_status.description = cl_getmsg(g_status.code,g_lang)
                   LET l_success2 = 'N'
                   CALL s_transaction_end('N','0')
                   EXIT FOR
                END IF
                LET l_isam[l_d].isam027 = l_isam[l_d].isam028 - l_isam[l_d].isam026
              END IF
          END IF  
          #插入
          INSERT INTO isam_t
                  (isament,
                   isamdocno,isamseq, 
                   isam001,isam008,isam037,isam011,isam010,isam030,isam009,isam012,
                   isam0121,isam013,isam014,isam015,isam023,isam024,isam025,isam026,
                   isam027,isam028,isamcomp,isamstus,isam002,isam004,isam016,isam017,
                   isam018,isam019,isam020,isam021,isam022,isam029,isam031,isam032,
                   isam033,isam034,isam038,isam039,
                   isam036,isam050,isamownid,isamowndp,isamcrtid,isamcrtdp,isamcrtdt,isammodid,isammoddt) 
            VALUES(g_enterprise,
                   l_apca.apcadocno,l_isam[l_d].isamseq,
                   l_isam[l_d].isam001,l_isam[l_d].isam008,l_isam[l_d].isam037,l_isam[l_d].isam011, 
                   l_isam[l_d].isam010,l_isam[l_d].isam030,l_isam[l_d].isam009,l_isam[l_d].isam012, 
                   l_isam[l_d].isam0121,l_isam[l_d].isam013,l_isam[l_d].isam014,l_isam[l_d].isam015, 
                   l_isam[l_d].isam023,l_isam[l_d].isam024,l_isam[l_d].isam025,l_isam[l_d].isam026, 
                   l_isam[l_d].isam027,l_isam[l_d].isam028,l_isam[l_d].isamcomp,l_isam[l_d].isamstus, 
                   l_isam[l_d].isam002,l_isam[l_d].isam004,l_isam[l_d].isam016,l_isam[l_d].isam017, 
                   l_isam[l_d].isam018,l_isam[l_d].isam019,l_isam[l_d].isam020,l_isam[l_d].isam021, 
                   l_isam[l_d].isam022,l_isam[l_d].isam029,l_isam[l_d].isam031,l_isam[l_d].isam032, 
                   l_isam[l_d].isam033,l_isam[l_d].isam034,l_isam[l_d].isam038,l_isam[l_d].isam039,
                   l_isam[l_d].isam036,l_isam[l_d].isam050,l_isam[l_d].isamownid,l_isam[l_d].isamowndp,
                   l_isam[l_d].isamcrtid,l_isam[l_d].isamcrtdp,l_isam[l_d].isamcrtdt,l_isam[l_d].isammodid,
                   l_isam[l_d].isammoddt) 
          IF SQLCA.sqlcode THEN
             LET l_success2 = 'N'
             LET g_status.code = SQLCA.sqlcode
             LET g_status.description = cl_getmsg(g_status.code,g_lang)
             CALL s_transaction_end('N','0')
             EXIT FOR
          END IF
      END FOR      
      END IF #  add by lixwz201103     
      
      ###apce,单身#####
      IF l_success2 ='Y' THEN #  add by lixwz201103     
      LET l_cnt3 = awsp900_01_getDetailRecordLength(l_node,'apce_t')
      FOR l_c = 1 TO l_cnt3 #单身
          LET l_node3 = awsp900_01_getDetailRecord(l_node,l_c,'apce_t')
          LET l_apce[l_c].apce003 = awsp900_01_getRecordField(l_node3,"apce003")  #冲销单号
          LET l_apce[l_c].apce004 = awsp900_01_getRecordField(l_node3,"apce004")  #冲销项次
          LET l_apce[l_c].apce109 = awsp900_01_getRecordField(l_node3,"apce109")  #冲销金额   
          #項次
            SELECT MAX(apceseq)+1 INTO l_apce[l_c].apceseq  FROM apce_t
             WHERE apceent = g_enterprise AND apcedocno = l_apca.apcadocno
            IF cl_null(l_apce[l_c].apceseq ) OR l_apce[l_c].apceseq  = 0 THEN
               LET l_apce[l_c].apceseq  = 1
            END IF
            LET l_apce[l_c].apce002  = '41' 
          #預支款沖抵預設N
            LET l_apce[l_c].apce027  = 'N'     
            LET l_apce[l_c].apce015  = s_fin_get_scc_value('8506',l_apce[l_c].apce002 ,'1')
            LET l_apce[l_c].apce005  = 0
            
          #apce003,apce004,apce005
            SELECT (apcc108-apcc109),(apcc118-apcc119),apcc100,apcc101
              INTO l_apce1.apce109,l_apce1.apce119,l_apce1.apce100,l_apce1.apce101
              FROM apcc_t
             WHERE apccld = l_apca.apcald
               AND apccdocno = l_apce[l_c].apce003
               AND apccent = g_enterprise
               AND apccseq  = l_apce[l_c].apce004
               AND apcc001  = l_apce[l_c].apce005
               
           IF l_apce[l_c].apce109 > l_apce1.apce109 THEN
               LET g_status.code = 'axr-00147'
               LET g_status.description = cl_getmsg(g_status.code,g_lang)
               LET l_success2 = 'N'
               CALL s_transaction_end('N','0')
               EXIT FOR
           END IF           
        
           #幣別
             LET l_apce[l_c].apce100 = l_apce1.apce100   
           #匯率
             LET l_apce[l_c].apce101 = l_apce1.apce101   
             IF NOT cl_ap_chk_Range(l_apce[l_c].apce101,"0.000","0","","","azz-00079",1) THEN
               LET g_status.code = g_errno
               LET g_status.description = cl_getmsg(g_status.code,g_lang)
               LET l_success2 = 'N'
               CALL s_transaction_end('N','0')
               EXIT FOR
             END IF
 
             IF NOT cl_null(l_apce[l_c].apce101) THEN
                LET l_apce[l_c].apce119 = l_apce[l_c].apce109 * l_apce[l_c].apce101
                CALL s_curr_round_ld('1',l_apca.apcald,g_glaa001,l_apce[l_c].apce119,2) 
                          RETURNING g_sub_success,g_errno,l_apce[l_c].apce119 
             END IF  
           #科目
             SELECT apca035,apca057 INTO l_apce[l_c].apce016,l_apce[l_c].apce017
              FROM apca_t
             WHERE apcadocno = l_apce[l_c].apce003
               AND apcald = l_apca.apcald
               AND apca001 = '26'
               AND apcaent = g_enterprise 
           #SA提醒此時的發票號碼用單號+項次+期別取得
              LET l_apce048 = NULL
              SELECT apcc009 INTO l_apce048 FROM apcc_t
               WHERE apccent = g_enterprise
                 AND apccld  = l_apca.apcald
                 AND apccdocno =  l_apce[l_c].apce003
                 AND apccseq   = l_apce[l_c].apce004
                 AND apcc001   = l_apce[l_c].apce005
            #冲销单号检核
               CALL cwssp500_chk_apce003_apce004(l_apce[l_c].*,l_apca.*) RETURNING g_sub_success,g_errno
               IF NOT g_sub_success THEN
                   LET g_status.code = g_errno
                   LET g_status.description = cl_getmsg(g_status.code,g_lang)
                   LET l_success2 = 'N'
                   CALL s_transaction_end('N','0')
                   EXIT FOR
               END IF
               

                  IF g_glaa.glaa015 = 'Y' THEN
                    LET l_apce121 = 1
                    IF g_glaa.glaa017 = '1' THEN
                     #換算基準:交易幣
                       LET l_curr = l_apce[l_c].apce100
                       LET l_apce129 = l_apce[l_c].apce109
                    ELSE
                       #換算基準:帳別本幣
                       LET l_curr = g_glaa001
                       LET l_apce129 = l_apce[l_c].apce119
                    END IF
                    CALL s_aooi160_get_exrate('2',l_apca.apcald,l_apca.apcadocdt,l_curr,l_apca.apca120,0,g_glaa.glaa018)
                         RETURNING l_apce121
                    LET l_apce129 = l_apce129 * l_apce121     
                    IF cl_null(l_apce129 )THEN LET l_apce129  = 0 END IF
                    CALL s_curr_round_ld('1',l_apca.apcald,l_apca.apca120,l_apce129,2) RETURNING g_sub_success,g_errno,l_apce129 
                  END IF
                 IF cl_null(l_apce129) THEN LET l_apce129 = 0 END IF
                 #其他本位幣三
                 IF g_glaa.glaa019 = 'Y' THEN
                    LET l_apce131 = 1
                    IF g_glaa.glaa021 = '1' THEN
                       #換算基準:交易幣
                       LET l_curr = l_apce[l_c].apce100
                       LET l_apce139 = l_apce[l_c].apce109
                    ELSE
                       #換算基準:帳別本幣
                       LET l_curr = g_glaa001
                       LET l_apce139 = l_apce[l_c].apce119
                    END IF
                    CALL s_aooi160_get_exrate('2',l_apca.apcald,l_apca.apcadocdt,l_curr,l_apca.apca120,0,g_glaa.glaa018)
                         RETURNING l_apce131
                    LET l_apce139 = l_apce139 * l_apce131     
                    IF cl_null(l_apce139)THEN LET l_apce139  = 0 END IF
                    CALL s_curr_round_ld('1',l_apca.apcald,l_apca.apca130,l_apce139,2) RETURNING g_sub_success,g_errno,l_apce139 
                 END IF
                 IF cl_null(l_apce139) THEN LET l_apce139 = 0 END IF
          #插入
          INSERT INTO apce_t
                  (apceent,apceld,apcedocno,apceseq,apce002,
                   apce003,apce004,apce005,apce100,apce109,
                   apce101,apce119,apce027,apce009,apce015,
                   apce016,apce017,apce018,apce019,apce020,
                   apce022,apce023,apce035,apce036,apce044,
                   apce045,
                   apce046,apce051,apce052,apce053,apce054,
                   apce055,apce056,apce057,apce058,apce059,
                   apce060,apce008,apce024,apce025,apce011,
                   apce012,apce026,apce021,apce048,apce001,
                   apce121,apce129,apce131,apce139,   
                   apce103,apce104,apce113,apce114,   
                   apce123,apce124,apce133,apce134,   
                   apcecomp,apcesite,apceorga)  
                   VALUES(g_enterprise,l_apca.apcald,l_apca.apcadocno,l_apce[l_c].apceseq,l_apce[l_c].apce002,
                          l_apce[l_c].apce003,l_apce[l_c].apce004,l_apce[l_c].apce005,l_apce[l_c].apce100,l_apce[l_c].apce109,
                          l_apce[l_c].apce101,l_apce[l_c].apce119,l_apce[l_c].apce027,l_apce[l_c].apce009,l_apce[l_c].apce015,
                          l_apce[l_c].apce016,l_apce[l_c].apce017,l_apce[l_c].apce018,l_apce[l_c].apce019,l_apce[l_c].apce020,
                          l_apce[l_c].apce022,l_apce[l_c].apce023,l_apce[l_c].apce035,l_apce[l_c].apce036,l_apce[l_c].apce044,
                          l_apce[l_c].apce045,
                          l_apce[l_c].apce046,l_apce[l_c].apce051,l_apce[l_c].apce052,l_apce[l_c].apce053,l_apce[l_c].apce054,
                          l_apce[l_c].apce055,l_apce[l_c].apce056,l_apce[l_c].apce057,l_apce[l_c].apce058,l_apce[l_c].apce059,
                          l_apce[l_c].apce060,l_apce[l_c].apce008,l_apce[l_c].apce024,l_apce[l_c].apce025,l_apce[l_c].apce011,
                          l_apce[l_c].apce012,l_apce[l_c].apce026,l_apce[l_c].apce021,l_apce048,'aapt331',  
                          l_apce121,l_apce129,l_apce131,l_apce139,  
                          l_apce[l_c].apce109,0,l_apce[l_c].apce119,0,   
                          l_apce129,0,l_apce139,0,   
                          l_apca.apcacomp,l_apca.apcasite,l_apca.apcacomp)
                          
         IF SQLCA.sqlcode THEN
             LET l_success2 = 'N'
             LET g_status.code = SQLCA.sqlcode
             LET g_status.description = cl_getmsg(g_status.code,g_lang)
             CALL s_transaction_end('N','0')
             EXIT FOR
          END IF
      END FOR
      #add muping170417 str
      END IF #  add by lixwz201103     
      
      ######apde 直接付款#######
      IF l_success2 ='Y' THEN #  add by lixwz201103     
      LET l_cnt4 = awsp900_01_getDetailRecordLength(l_node,'apde_t')            
      FOR l_e = 1 TO l_cnt4 #单身
          LET l_node4 = awsp900_01_getDetailRecord(l_node,l_e,'apde_t')
          #add muping170430 str 缴款 还款
          IF g_apcatype= 'HK' THEN
             LET l_apce2[l_e].apce008_b2 = awsp900_01_getRecordField(l_node4,"apde008")  #付款账户
             LET l_apce2[l_e].apce100_b2 = awsp900_01_getRecordField(l_node4,"apde100")  #币别
             LET l_apce2[l_e].apce109_b2 = awsp900_01_getRecordField(l_node4,"apde109")  #付款金额 
             LET l_apce2[l_e].apce012_b2 = awsp900_01_getRecordField(l_node4,"apde011")   #银行存提码
             #预设
             LET l_apce2[l_e].apce006_b2 = '10'
             SELECT MAX(apceseq)+1 INTO l_apce2[l_e].apceseq_b2 FROM apce_t
             WHERE apceent = g_enterprise AND apcedocno = l_apca.apcadocno
             IF cl_null(l_apce2[l_e].apceseq_b2) OR l_apce2[l_e].apceseq_b2 = 0 THEN
                LET l_apce2[l_e].apceseq_b2 = 1
             END IF 

             LET l_apce2[l_e].apce002_b2 = '17'  
             LET l_apce2[l_e].apce015_b2 = s_fin_get_scc_value('8506',l_apce2[l_e].apce002_b2,'1')
             #sa說17類當做現金抓科目
             LET l_apce2[l_e].apce016_b2 = s_aapt420_bring_acc_code2(l_apca.apcald,l_apca.apcasite,l_apca.apca057,'10',l_apce2[l_e].apce006_b2,'')
             #check 币别
             CALL s_aap_ooaj001_chk(l_apca.apcald,l_apce2[l_e].apce100_b2) RETURNING g_sub_success,g_errno
             IF NOT g_sub_success THEN
                LET g_status.code = g_errno
                LET g_status.description = cl_getmsg(g_status.code,g_lang)
                LET l_success2 = 'N'
                CALL s_transaction_end('N','0')
                EXIT FOR
             END IF 
             #求汇率
             IF g_glaa.glaa001 = l_apce2[l_e].apce100_b2 THEN
                LET l_apce2[l_e].apce101_b2 = 1
             ELSE
                #取該幣別在預支待抵單身同幣別的平均匯率
                LET l_apce2[l_e].apce101_b2 = NULL
                SELECT AVG(apce101) INTO l_apce2[l_e].apce101_b2 FROM apce_t
                 WHERE apceent = g_enterprise
                   AND apceld  = l_apca.apcald
                   AND apcedocno =  l_apca.apcadocno
                   AND apce002 <> '17'
                   AND apce100 = l_apce2[l_e].apce100_b2
                IF cl_null(l_apce2[l_e].apce101_b2)THEN
                   LET l_apce2[l_e].apce101_b2 = 1
                END IF
             END IF
             #本币金额
             LET l_apce2[l_e].apce119_b2 = l_apce2[l_e].apce109_b2 * l_apce2[l_e].apce101_b2
             #apce008账户 带出 资金科目
             SELECT glab005 INTO l_apce2[l_e].apce016_b2
                       FROM glab_t
                       WHERE glabent = g_enterprise
                         AND glabld =  l_apca.apcald
                         AND glab001 = '40'
                         AND glab002 = '40'
                         AND glab003 = l_apce2[l_e].apce008_b2
            #存提码
            LET l_apce2[l_e].apce013_b2 = s_anm_get_nmad003(g_glaa.glaa005,l_apce2[l_e].apce012_b2)
            INSERT INTO apce_t
                  (apceent,apceld,apcedocno,apceseq,
                   apce002,apce006,apce100,apce109,
                   apce008,apce101,apce119,apce010,apce003,
                   apce004,apce015,apce012,apce013,
                   apce016,apce017,
                   apce018,apce019,
                   apce020,apce022,apce023,apce027,
                   apce035,apce036,
                   apce044,apce045,apce046,
                   apce051,apce052,
                   apce053,apce054,apce055,
                   apce056,apce057,
                   apce058,apce059,apce060,apce001,
                   apce121,apce129,apce131,apce139,  
                   apce103,apce104,apce113,apce114,   
                   apce123,apce124,apce133,apce134, 
                   apcecomp,apcesite,apceorga)   
                   VALUES(g_enterprise,l_apca.apcald,l_apca.apcadocno,l_apce2[l_e].apceseq_b2,
                          l_apce2[l_e].apce002_b2,l_apce2[l_e].apce006_b2,l_apce2[l_e].apce100_b2,l_apce2[l_e].apce109_b2,
                          l_apce2[l_e].apce008_b2,l_apce2[l_e].apce101_b2,l_apce2[l_e].apce119_b2,l_apce2[l_e].apce010_b2,l_apce2[l_e].apce003_b2,
                          l_apce2[l_e].apce004_b2,l_apce2[l_e].apce015_b2,l_apce2[l_e].apce012_b2,l_apce2[l_e].apce013_b2,
                          l_apce2[l_e].apce016_b2,l_apce2[l_e].apce017_b2,
                          l_apce2[l_e].apce018_b2,l_apce2[l_e].apce019_b2,
                          l_apce2[l_e].apce020_b2,l_apce2[l_e].apce022_b2,l_apce2[l_e].apce023_b2,'N',
                          l_apce2[l_e].apce035_b2,l_apce2[l_e].apce036_b2,
                          l_apce2[l_e].apce044_b2,l_apce2[l_e].apce045_b2,l_apce2[l_e].apce046_b2,
                          l_apce2[l_e].apce051_b2,l_apce2[l_e].apce052_b2,
                          l_apce2[l_e].apce053_b2,l_apce2[l_e].apce054_b2,l_apce2[l_e].apce055_b2,
                          l_apce2[l_e].apce056_b2,l_apce2[l_e].apce057_b2,
                          l_apce2[l_e].apce058_b2,l_apce2[l_e].apce059_b2,l_apce2[l_e].apce060_b2,'aapt330',
                          #l_apce121,l_apce129,l_apce131,l_apce139,
                          0,0,0,0,                          
                          l_apce2[l_e].apce109_b2,0,l_apce2[l_e].apce119_b2,0,
                          #l_apce129,0,l_apce139,0,
                          0,0,0,0,
                          l_apca.apcacomp,l_apca.apcasite,l_apca.apcacomp)     
              IF SQLCA.sqlcode THEN 
                 LET l_success2 = 'N'
                 LET g_status.code = SQLCA.sqlcode
                 LET g_status.description = cl_getmsg(g_status.code,g_lang)
                 CALL s_transaction_end('N','0')
                 EXIT FOR
              END IF
          ELSE
          #add muping170430 end
             LET l_apde[l_e].apde008 = awsp900_01_getRecordField(l_node4,"apde008")  #付款账户
             LET l_apde[l_e].apde100 = awsp900_01_getRecordField(l_node4,"apde100")  #币别
             LET l_apde[l_e].apde109 = awsp900_01_getRecordField(l_node4,"apde109")  #付款金额 
             LET l_apde[l_e].apde011 = awsp900_01_getRecordField(l_node4,"apde011")   #存提码
             
             #赋默认值
             LET l_apde[l_e].apdeseq = NULL
             SELECT MAX(apdeseq)+1 INTO l_apde[l_e].apdeseq FROM apde_t
              WHERE apdeent = g_enterprise
                AND apdeld  = l_apca.apcald
                AND apdedocno = l_apca.apcadocno
             IF cl_null(l_apde[l_e].apdeseq) THEN
                LET l_apde[l_e].apdeseq = 1
             END IF 
             LET l_apde[l_e].apde002 = "10"
             LET l_apde[l_e].apde006 = "20"
             LET l_apde[l_e].apdeld = l_apca.apcald
             LET l_apde[l_e].apdedocno = l_apca.apcadocno
             LET l_apde[l_e].apde001 = 'aapt330'#g_prog  #mod muping170425
             
             #LET l_nmag002 = '1'   #款別為20:現金,帳戶運用類型指定為不限制
             LET l_apde[l_e].apde009 = 'N'
             LET l_apde[l_e].apde015 = s_fin_get_scc_value('8506',l_apde[l_e].apde002,'3')
              
             LET l_apde[l_e].apdecomp = l_apca.apcacomp
              
             LET l_apde[l_e].apdeorga = l_apca.apcasite #160908-00036#1
              
              
             LET l_apde[l_e].apdesite = l_apca.apcasite
             LET l_apde[l_e].apde032 = l_apca.apcadocdt
             LET l_apde[l_e].apde038 = l_apca.apca005
             #CALL s_aapt420_get_primary_pay_bank(l_apca.apca005) RETURNING l_apde[l_e].apde039,l_apde[l_e].apde040 #mark by jixf 190226 此函数定义为2个参数，故调用时须传两个参数
             CALL s_aapt420_get_primary_pay_bank(l_apca.apca005,l_apca.apcasite) RETURNING l_apde[l_e].apde039,l_apde[l_e].apde040 #add by jixf 190226 增加据点传参           
              
             SELECT pmaf004 INTO l_apde[l_e].apde041
               FROM pmaf_t
              WHERE pmafent = g_enterprise AND pmaf001 = l_apca.apca005
                AND pmaf009 = 'Y' AND pmafstus = 'Y'  #取主要付款帳戶
              
             IF l_apde[l_e].apde006 ='30' THEN
                LET l_apde[l_e].apde016  = s_aapt420_bring_acc_code2(l_apca.apcald,l_apde[l_e].apdesite,l_apde[l_e].apde038,l_apde[l_e].apde002,l_apde[l_e].apde006,l_apde[l_e].apde021)  
                LET l_apde[l_e].apde0162 =l_apde[l_e].apde016
             ELSE
                LET l_apde[l_e].apde016  = s_aapt420_bring_acc_code2(l_apca.apcald,l_apde[l_e].apdesite,l_apde[l_e].apde038,l_apde[l_e].apde002,l_apde[l_e].apde006,l_apde[l_e].apde008)  
                LET l_apde[l_e].apde0162 =l_apde[l_e].apde016
             END IF
             #apde008  检查银行账户
             SELECT  CASE 
               WHEN (nmaastus <> 'Y') THEN 'ade-00010' 
               WHEN (nmag002 NOT IN ('1') AND nmag002 <> '1') THEN 'anm-00237' 
               WHEN (nmaa002 NOT IN (SELECT ooef001 FROM ooef_t WHERE ooefent = g_enterprise AND ooef017 = l_apca.apcacomp)) THEN 'anm-00026' 
               ELSE '1' END 
               INTO l_code
             FROM nmas_t,nmaa_t,nmag_t
             WHERE nmas002 = l_apde[l_e].apde008
                  AND nmasent = g_enterprise 
                  AND nmasent = nmaaent AND nmas001 = nmaa001 
                  AND nmagent = nmaaent 
                  AND nmag001 = nmaa003
             IF l_code <> '1' THEN
                LET g_status.code = l_code
                LET g_status.description = cl_getmsg(g_status.code,g_lang)
                LET l_success2 = 'N'
                CALL s_transaction_end('N','0')
                EXIT FOR
             END IF 
             #apde100 币别  带出汇率 apde101
             CALL s_aap_ooaj001_chk(l_apca.apcald,l_apde[l_e].apde100) RETURNING g_sub_success,g_errno
             IF NOT g_sub_success THEN
                LET g_status.code = g_errno
                LET g_status.description = cl_getmsg(g_status.code,g_lang)
                LET l_success2 = 'N'
                CALL s_transaction_end('N','0')
                EXIT FOR
             END IF
             #若付款原幣與單據單頭交易幣相同，預設單據匯率
             SELECT apca100,apca101,apca121,apca131
               INTO l_apca100,l_apde[l_e].apde101,l_apde[l_e].apde121,l_apde[l_e].apde131
               FROM apca_t
              WHERE apcaent = g_enterprise
                AND apcald = l_apca.apcald AND apcadocno = l_apca.apcadocno
             IF l_apca100 <> l_apde[l_e].apde100 THEN
                LET lc_param.apca004 = l_apca.apca004
                LET ls_js = util.JSON.stringify(lc_param)
                CALL s_fin_get_curr_rate(l_apca.apcacomp,l_apca.apcald,l_apca.apcadocdt,l_apde[l_e].apde100,ls_js)
                     RETURNING l_apde[l_e].apde101,l_apde[l_e].apde121,l_apde[l_e].apde131
             END IF
             
             #本幣金額 = 原幣金額 * 本幣匯率
             #本幣重計
             LET l_apde[l_e].apde119 = l_apde[l_e].apde109 * l_apde[l_e].apde101
             IF cl_null(l_apde[l_e].apde119) THEN LET l_apde[l_e].apde119 = 0 END IF
             CALL s_curr_round_ld('1',l_apca.apcald,g_glaa.glaa001,l_apde[l_e].apde119,2) RETURNING g_sub_success,g_errno,l_apde[l_e].apde119   
             DISPLAY BY NAME l_apde[l_e].apde101,l_apde[l_e].apde119
             #本幣二重計
             IF g_glaa.glaa015 = 'Y' THEN
                LET l_apde[l_e].apde129 = l_apde[l_e].apde109 * l_apde[l_e].apde121
                IF cl_null(l_apde[l_e].apde129) THEN LET l_apde[l_e].apde129 = 0 END IF
                CALL s_curr_round_ld('1',l_apca.apcald,g_glaa.glaa016,l_apde[l_e].apde129,2) RETURNING g_sub_success,g_errno,l_apde[l_e].apde129  #160201-00016#1   改為glaa016
                DISPLAY BY NAME l_apde[l_e].apde121,l_apde[l_e].apde129
             END IF
             #本幣三重計
             IF g_glaa.glaa019 = 'Y' THEN
                LET l_apde[l_e].apde139 = l_apde[l_e].apde109 * l_apde[l_e].apde131
                IF cl_null(l_apde[l_e].apde139) THEN LET l_apde[l_e].apde139 = 0 END IF
                CALL s_curr_round_ld('1',l_apca.apcald,g_glaa.glaa020,l_apde[l_e].apde139,2) RETURNING g_sub_success,g_errno,l_apde[l_e].apde139  #改為glaa020
             END IF    
             #apde109  计算金额
             
      
             LET l_apde[l_e].apde012 = s_anm_get_nmad003(g_glaa.glaa005,l_apde[l_e].apde011)
              INSERT INTO apde_t
                     (apdeent,
                      apdeld,apdedocno,apdeseq
                      ,apdeorga,apde002,apde006,apde008,apde021,apde024,apde015,apde016,apde100,apde109,apde101,apde119,apde032,apde013,apde014,apde010,apde009,apde039,apde040,apde041,apde011,apde012,apdecomp,apdesite,apde001,apde038,apde061,apde017,apde018,apde019,apde020,apde022,apde023,apde035,apde036,apde042,apde043,apde044,apde051,apde052,apde053,apde054,apde055,apde056,apde057,apde058,apde059,apde060,apde120,apde121,apde129,apde130,apde131,apde139) 
               VALUES(g_enterprise,
                      l_apde[l_e].apdeld,l_apde[l_e].apdedocno,l_apde[l_e].apdeseq
                      ,l_apde[l_e].apdeorga,l_apde[l_e].apde002,l_apde[l_e].apde006,l_apde[l_e].apde008, 
                          l_apde[l_e].apde021,l_apde[l_e].apde024,l_apde[l_e].apde015,l_apde[l_e].apde016, 
                          l_apde[l_e].apde100,l_apde[l_e].apde109,l_apde[l_e].apde101,l_apde[l_e].apde119, 
                          l_apde[l_e].apde032,l_apde[l_e].apde013,l_apde[l_e].apde014,l_apde[l_e].apde010, 
                          l_apde[l_e].apde009,l_apde[l_e].apde039,l_apde[l_e].apde040,l_apde[l_e].apde041, 
                          l_apde[l_e].apde011,l_apde[l_e].apde012,l_apde[l_e].apdecomp,l_apde[l_e].apdesite, 
                          l_apde[l_e].apde001,l_apde[l_e].apde038,l_apde[l_e].apde061,l_apde[l_e].apde017, 
                          l_apde[l_e].apde018,l_apde[l_e].apde019,l_apde[l_e].apde020,l_apde[l_e].apde022, 
                          l_apde[l_e].apde023,l_apde[l_e].apde035,l_apde[l_e].apde036,l_apde[l_e].apde042, 
                          l_apde[l_e].apde043,l_apde[l_e].apde044,l_apde[l_e].apde051,l_apde[l_e].apde052, 
                          l_apde[l_e].apde053,l_apde[l_e].apde054,l_apde[l_e].apde055,l_apde[l_e].apde056, 
                          l_apde[l_e].apde057,l_apde[l_e].apde058,l_apde[l_e].apde059,l_apde[l_e].apde060, 
                          l_apde[l_e].apde120,l_apde[l_e].apde121,l_apde[l_e].apde129,l_apde[l_e].apde130, 
                          l_apde[l_e].apde131,l_apde[l_e].apde139)
             IF SQLCA.sqlcode THEN
                LET l_success2 = 'N'
                LET g_status.code = SQLCA.sqlcode
                LET g_status.description = cl_getmsg(g_status.code,g_lang)
                CALL s_transaction_end('N','0')
                EXIT FOR
             END IF
          END IF #add muping170430
      END FOR
      #add muping170417 end
      END IF #  add by lixwz201103     

      #回写单头金额
      IF l_success2 = 'Y' THEN
         INITIALIZE l_amount.* TO NULL
         CALL s_aap_clac_bill_master(l_apca.apcald,l_apca.apcadocno) RETURNING l_amount.*
         
         LET l_apca.apcamoddt = cl_get_current()
         #重展多帳期前 先把匯率寫回資料庫
         UPDATE apca_t SET (apca101,apca103,apca104,apca106,apca107,apca108,
                                    apca113,apca114,apca116,apca117,apca118,
                            apca121,apca123,apca124,apca126,apca127,apca128,
                            apca131,apca133,apca134,apca136,apca137,apca138,
                            apcamodid,apcamoddt) =
                           (l_apca.apca101,l_amount.apcb103,l_amount.xrcd104,l_amount.apca106,l_amount.apca107,l_amount.apca108,
                                             l_amount.apcb113,l_amount.xrcd114,l_amount.apca116,l_amount.apca117,l_amount.apca118,
                            l_apca.apca121,l_amount.apcb123,l_amount.xrcd124,l_amount.apca126,l_amount.apca127,l_amount.apca128,
                            l_apca.apca131,l_amount.apcb133,l_amount.xrcd134,l_amount.apca136,l_amount.apca137,l_amount.apca138,
                            g_user,l_apca.apcamoddt)
           WHERE apcaent = g_enterprise AND apcald = l_apca.apcald
             AND apcadocno = l_apca.apcadocno
         IF SQLCA.sqlcode THEN
            LET l_success2 = 'N'
            LET g_status.code = SQLCA.sqlcode
            LET g_status.description = cl_getmsg(g_status.code,g_lang)
            CALL s_transaction_end('N','0')
            EXIT FOR
         END IF
         
         CALL s_aap_multi_bill_period(l_apca.apcald,l_apca.apcadocno)RETURNING g_sub_success,g_errno
         IF NOT cl_null(g_errno) THEN
            LET l_success2 = 'N'
            LET g_status.code = SQLCA.sqlcode
            LET g_status.description = cl_getmsg(g_status.code,g_lang)
            CALL s_transaction_end('N','0')
            EXIT FOR
         
         END IF
      END IF
      
    IF g_glaa.glaa121 = 'Y' THEN   
      #產生分錄底稿
      IF l_success2 = 'Y' THEN
          IF NOT cl_null(l_apca.apcadocno) AND l_apca.apcastus = 'N' THEN
              CALL s_pre_voucher_ins('AP','P10',l_apca.apcald,l_apca.apcadocno,l_apca.apcadocdt,'1')  #???
              RETURNING g_sub_success
              IF NOT g_sub_success THEN
                LET g_status.code = g_errno
                LET g_status.description = cl_getmsg(g_status.code,g_lang)
                LET l_success2 = 'N'
                CALL s_transaction_end('N','0')
                EXIT FOR
              END IF
          END IF
      END IF 
    END IF   
   
      #S---#C20190307#1 add by zhaoqn
      CALL s_aooi200_fin_get_slip(l_apca.apcadocno) RETURNING g_sub_success,g_ap_slip
      CALL s_fin_get_doc_para(l_apca.apcald,l_apca.apcacomp,g_ap_slip,'D-FIN-0031') RETURNING g_dfin0031
      CALL s_fin_get_doc_para(l_apca.apcald,l_apca.apcacomp,g_ap_slip,'D-FIN-0032') RETURNING g_dfin0032
      #审核
#      IF l_success2 = 'Y' THEN     #C20190307#1 mark by zhaoqn
      IF l_success2 = 'Y' AND g_dfin0031 = 'Y' THEN      
      #E---#C20190307#1 add by zhaoqn
         LET g_prog = 'aapt330'
         CALL s_aapt330_prepare_declare() 
         CALL s_aapt330_conf_chk(l_apca.apcald,l_apca.apcadocno) RETURNING r_success
         IF r_success THEN
               #確認交易處理段
               CALL s_aapt330_conf_upd(l_apca.apcald,l_apca.apcadocno) RETURNING g_sub_success
               IF NOT g_sub_success THEN
                  LET l_success2 = 'N'
                  LET g_status.code = SQLCA.sqlcode
                  LET g_status.description = cl_getmsg(g_status.code,g_lang)
                  CALL s_transaction_end('N','0')
                  EXIT FOR
               END IF
         ELSE 
                LET l_success2 = 'N'
                LET g_status.code = SQLCA.sqlcode
                LET g_status.description = cl_getmsg(g_status.code,g_lang)
                CALL s_transaction_end('N','0')
                EXIT FOR         
         END IF
      END IF
      
#      IF l_success2 = 'Y' THEN     #C20190307#1 mark by zhaoqn
      IF l_success2 = 'Y' AND g_dfin0031 = 'Y' AND g_dfin0032 = 'Y' THEN   #C20190307#1 add by zhaoqn
         CALL s_transaction_end('Y','0')
         #产生凭证
         LET g_gl_slip = ''
         LET g_ap_slip = ''
         CALL s_aooi200_fin_get_slip(l_apca.apcadocno) RETURNING g_sub_success,g_ap_slip
         CALL s_fin_get_doc_para(l_apca.apcald,l_apca.apcacomp,g_ap_slip,'D-FIN-2002') RETURNING g_gl_slip
         IF cl_null(g_gl_slip) THEN
            LET l_success2 = 'N'
            LET g_status.code = 'aap-00219'
            LET g_status.description = cl_getmsg(g_status.code,g_lang)
            EXIT FOR
          END IF
          LET la_param.prog = 'aapp330'
          IF NOT cl_null(g_gl_slip) THEN 
            LET la_param.param[1] = l_apca.apcald        #帳套
            LET la_param.param[2] = l_apca.apcadocno     #單號
            LET la_param.param[3] = g_gl_slip            #總帳單別
            LET la_param.param[4] = l_apca.apcadocdt     #日期
            LET la_param.param[5] = l_apca.apcasite      #帳務中心
            LET la_param.param[6] = 'Y'                  #背景作业
          END IF
          LET ls_js = util.JSON.stringify( la_param )
          CALL cl_cmdrun_wait(ls_js)  
          SELECT apca038 INTO l_apca.apca038
              FROM apca_t
             WHERE apcaent = g_enterprise
               AND apcald  = l_apca.apcald AND apcadocno = l_apca.apcadocno 
          IF cl_null(l_apca.apca038) THEN 
              LET l_success2 = 'N'   
              LET g_status.code ='-1'
              LET g_status.description = "凭证号码失败！"
              CALL s_aapt330_unconf_upd(l_apca.apcald,l_apca.apcadocno) RETURNING g_sub_success
              DELETE FROM apca_t WHERE apcaent = g_enterprise AND apcald = l_apca.apcald AND apcadocno = l_apca.apcadocno
              CALL s_aooi200_fin_del_docno(l_apca.apcald,l_apca.apcadocno,l_apca.apcadocdt) RETURNING g_sub_success
              DELETE FROM apcb_t WHERE apcbent = g_enterprise AND apcbld = l_apca.apcald AND apcbdocno = l_apca.apcadocno
              CALL s_aapt300_del_sub_table(l_apca.apcald,l_apca.apcadocno) RETURNING g_sub_success,g_errno,l_str
              DELETE FROM bgbd_t WHERE bgbdent = g_enterprise AND bgbd037 = l_apca.apcadocno
              DELETE FROM xrcd_t WHERE xrcdent = g_enterprise AND xrcdld = l_apca.apcald AND xrcddocno = l_apca.apcadocno     
         END IF           
      END IF
                  
                   
      #返回值
      LET l_return_apca.apcadocno   = ''     #报支单号 
      LET l_return_apca.apca038     = ''       #凭证
      IF l_success2 = 'Y' THEN
         CALL g_errlog_arr.clear()   #成功了后将这个值情空，否则会覆盖g_status.code
         LET g_status.code ='0'
         LET g_status.description = 'ERP报支单产生成功！' 
         LET l_return_apca.apcadocno   = l_apca.apcadocno     #报支单号 
         LET l_return_apca.apca038     = l_apca.apca038       #凭证         
      END IF
      LET l_return_apca.tran_status = l_success2           #状态码
      LET l_return_apca.tran_time   = cl_get_current()     #传输时间    
      LET l_master = awsp900_01_addMasterRecordField("APCA_T",util.JSONObject.fromFGL(l_return_apca)) 

      CALL s_aooi390_drop_tmp_table()
      DROP TABLE s_aap_tmp1            #多帳期
      DROP TABLE s_fin_tmp1            #下層組織
      DROP TABLE s_voucher_tmp         #分錄底稿  
   END FOR
   
 
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="cwssp500.other_function" readonly="Y" type="s" >}
#add-point:自定義元件(Function) name="other.function"

################################################################################
# Descriptions...: 复制aapt330中aapt330_source_doc_chk_b1(p_ac)程式，检查传入的冲销单号
# Memo...........:
# Usage..........: cwssp500_chk_apce003_apce004(l_apce,l_apca)
#                  RETURNING r_success,r_errno
# Date & Author..: 2017/03/16 By huna
# Modify.........:
################################################################################
PRIVATE FUNCTION cwssp500_chk_apce003_apce004(l_apce,l_apca)
   DEFINE l_apca   RECORD  LIKE apca_t.*
   DEFINE l_apce   RECORD
                   apceseq    LIKE apce_t.apceseq,
                   apce002    LIKE apce_t.apce002,
                   apce003    LIKE apce_t.apce003, 
                   apce004    LIKE apce_t.apce004, 
                   apce005    LIKE apce_t.apce005,  
                   apce100    LIKE apce_t.apce100,
                   apce109    LIKE apce_t.apce109,
                   apce101    LIKE apce_t.apce101,
                   apce119    LIKE apce_t.apce119,
                   apce027    LIKE apce_t.apce027,
                   apce009    LIKE apce_t.apce009,
                   apce015    LIKE apce_t.apce015,
                   apce016    LIKE apce_t.apce016,
                   apce017    LIKE apce_t.apce017,  
                   apce018    LIKE apce_t.apce018,
                   apce019    LIKE apce_t.apce019,
                   apce020    LIKE apce_t.apce020,
                   apce022    LIKE apce_t.apce022,
                   apce023    LIKE apce_t.apce023,
                   apce035    LIKE apce_t.apce035,
                   apce036    LIKE apce_t.apce036,
                   apce044    LIKE apce_t.apce044,
                   apce045    LIKE apce_t.apce045,
                   apce046    LIKE apce_t.apce046,
                   apce051    LIKE apce_t.apce051,
                   apce052    LIKE apce_t.apce052,
                   apce053    LIKE apce_t.apce053,
                   apce054    LIKE apce_t.apce054,
                   apce055    LIKE apce_t.apce055,
                   apce056    LIKE apce_t.apce056,
                   apce057    LIKE apce_t.apce057,
                   apce058    LIKE apce_t.apce058,
                   apce059    LIKE apce_t.apce059,
                   apce060    LIKE apce_t.apce060,
                   apce008    LIKE apce_t.apce008,
                   apce024    LIKE apce_t.apce024,
                   apce025    LIKE apce_t.apce025,
                   apce011    LIKE apce_t.apce011,
                   apce012    LIKE apce_t.apce012,
                   apce026    LIKE apce_t.apce026,
                   apce021    LIKE apce_t.apce021
                      END RECORD
   DEFINE r_success LIKE type_t.num5
   DEFINE r_errno   LIKE gzze_t.gzze001
   DEFINE l_count   LIKE type_t.num5
   DEFINE l_apca001 LIKE apca_t.apca001
   DEFINE l_stus    LIKE apca_t.apcastus
   DEFINE l_apcc109 LIKE type_t.num20_6
   DEFINE l_apca018 LIKE apca_t.apca018   #待抵單來源預支單
   DEFINE l_apca004 LIKE apca_t.apca004   #對象
   DEFINE l_apca014 LIKE apca_t.apca014   #業務人員
   DEFINE l_apcc108 LIKE apcc_t.apcc108 #add by zhangsba201224
   DEFINE l_apce109 LIKE apce_t.apce109 #add by zhangsba201224 

   
   LET r_success = TRUE
   LET r_errno  = '' 
   #單號先檢核
   IF NOT cl_null(l_apce.apce003)THEN
      LET l_apca001 = NULL
      LET l_stus    = NULL
      LET l_apca018 = NULL
      SELECT apca001,apcastus,apca018
        INTO l_apca001,l_stus,l_apca018
        FROM apca_t
       WHERE apcaent = g_enterprise
         AND apcald  = l_apca.apcald
         AND apcadocno = l_apce.apce003
      CASE
         WHEN SQLCA.SQLCODE = 100
            #
            LET r_errno = 'aap-00159'
            LET r_success = FALSE
         WHEN l_apca001 NOT MATCHES '2[136]'   #不為員工預支待抵 or AAPT310   150622-00005#1
            LET r_success = FALSE
            LET r_errno = 'aap-00367'

         #aapt310 必須符合 EMPL+員工
         WHEN l_apca001 MATCHES '2[13]' AND l_apca004 <> 'EMPL'
            LET r_success = FALSE
            LET r_errno = 'aap-00375'
         WHEN l_apca001 MATCHES '2[13]' AND l_apca014 <> l_apca.apca014
            LET r_success = FALSE
            LET r_errno = 'aap-00375'            

         WHEN l_stus <> 'Y'
            LET r_errno = 'aap-00162'
            LET r_success = FALSE
      END CASE      
      
#mark by huna20170321---s来源单号，存放BPM单号，暂时不做其他逻辑  
#  IF r_success THEN
#     #來源預支單必須已經沖抵完畢
#     LET l_apcc109 = NULL
#     SELECT SUM(apcc108-apcc109) INTO l_apcc109 FROM apcc_t
#      WHERE apccent = g_enterprise
#        AND apccdocno = l_apca018
#     IF cl_null(l_apcc109)THEN LET l_apcc109 = 0 END IF
#     IF l_apcc109 <> 0 THEN
#        LET r_errno = 'aap-00374'
#        LET r_success = FALSE         
#     END IF
#  END IF
#mark by huna20170321---e来源单号，存放BPM单号，暂时不做其他逻辑
   ELSE
      RETURN r_success,r_errno
   END IF
   IF NOT r_success THEN
      RETURN r_success,r_errno
   END IF
   
   #檢核金額
   IF NOT cl_null(l_apce.apce004)THEN
      LET l_apcc109 = NULL
      LET l_apcc108 = NULL #add by zhangsba201224
      LET l_apce109 = NULL #add by zhangsba201224
      #SELECT (apcc108-apcc109) INTO l_apcc109 FROM apcc_t  #mark by zhangsba201224 l_apcc109--l_apcc108
      SELECT apcc108 INTO l_apcc108 FROM apcc_t  #add by zhangsba201224
       WHERE apccent = g_enterprise
         AND apccld  = l_apca.apcald
         AND apccdocno = l_apce.apce003
         AND apccseq   = l_apce.apce004
         AND apcc001   = l_apce.apce005
      IF cl_null(l_apcc108)THEN LET l_apcc108 = 0 END IF
      
      #add by zhangsba201224--s
      SELECT SUM(apce109) INTO l_apce109 FROM apce_t
       WHERE apceent = g_enterprise
         AND apceld  = l_apca.apcald
         AND apce003 = l_apce.apce003
         AND apce004   = l_apce.apce004
         AND apce005   = l_apce.apce005
      IF cl_null(l_apce109)THEN LET l_apce109 = 0 END IF
      LET l_apcc109 =  l_apcc108 - l_apce109    
      #add by zhangsba201224--e
      CASE
         WHEN SQLCA.SQLCODE = 100
            #
            LET r_errno = 'aap-00163'
            LET r_success = FALSE
         WHEN l_apcc109 = 0 
            LET r_errno = 'aap-00273'
            LET r_success = FALSE
      END CASE      
      

      IF r_success THEN
         CALL s_aapt420_apcc_used_chk(l_apce.apce002,l_apca.apcald,l_apca.apcald,l_apce.apce003,
                                      l_apce.apce004,l_apce.apce005,
                                      l_apcc109,l_apca.apcadocno,l_apce.apceseq,'1','0')
                           RETURNING g_sub_success,g_errno
         IF NOT g_sub_success THEN
            LET r_success = FALSE
            LET r_errno = g_errno
         END IF
      END IF

   ELSE
      RETURN r_success,r_errno
   END IF
   
   RETURN r_success,r_errno
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL cwssp500_chk_apce109()
#                  RETURNING 回传参数
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION cwssp500_chk_apce109()

END FUNCTION

#end add-point
 
{</section>}
 
