#add by lixwz210701 s---
IF g_sfdc_d[l_ac].sfdc005 != g_sfdc_d_o.sfdc005 END IF
    CALL DIALOG.setFieldTouched("s_detail2.*", TRUE)
END IF
#add by lixwz210701 e---