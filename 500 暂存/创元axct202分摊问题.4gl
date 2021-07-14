#！ xcbj004 成本中心 xcbj103 分摊金额

#! xcbluc004 成本中心
# into xcblucent cxct201_01

LET l_xcbluc.xcbluc100 = (l_glar005 - l_glar006 + l_amt1) * l_xcba009 / 100
# 1、xcba_cur 成本分摊要素

# 2. sel_glar_cur 分摊科目和余额


#！ cxcp202 
#!  xcbluc_t 抓取组织编号金额
 SELECT xcblucent,
        xcblucld,
        xcbluc001,
        xcbluc002,
        xcbluc003,
        xcbluc004,
        xcbluc005,
        SUM(xcbluc100) xcbluc100,
        SUM(xcbluc110) xcbluc110,
        SUM(xcbluc120) xcbluc120
    FROM xcbluc_t
    WHERE xcblucent = 10
        AND xcblucld = '01-1' 
        AND xcbluc002 = '  2021'
        AND xcbluc003 = '    5'
    GROUP BY xcblucent,
        xcblucld,
        xcbluc001,
        xcbluc002,
        xcbluc003,
        xcbluc004,
        xcbluc005
