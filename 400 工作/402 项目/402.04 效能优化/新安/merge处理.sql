    select '2' sys5,
        apca035,
        glacl004,
        apca100,
        apca038,
        glaq010,
        glaq003,
        '' glgbdocno,
        '' glgb010,
        '' glgb003,
        apcadocno,
        0 xrcbseq,
        oobx004,
        xrcb105,
        l_sum xrcb115,
        '交易单金额与总账金额不符合 ' message_code,
        '请查看该单账款明细之账款科目与金额是否与总账不相符' advise,
        '5' flag
    FROM (
            SELECT '2',
                apca035,
                glacl004,
                apca100,
                '',
                '',
                apca038,
case
                    glac008
                    when '1' then -1 * glaq010
                    else glaq010
                end glaq010,
                case
                    glac008
                    when '1' then -1 * glaq003
                    else glaq003
                end glaq003,
                '',
                '',
                '',
                apcadocno,
                0,
                oobx004,
case
                    when apca001 like '2%' then -1 *(
                        NVL(SUM(apcc108), 0) - NVL(SUM(apcc109), 0) + NVL(SUM(t2.apce109), 0) + NVL(SUM(t1.apce1091), 0) + NVL(SUM(xrce109), 0) + NVL(SUM(apcf103), 0)
                    )
                    when apca001 in ('02', '04', '06') then -1 *(
                        NVL(SUM(apcc108), 0) - NVL(SUM(apcc109), 0) + NVL(SUM(t2.apce109), 0) + NVL(SUM(t1.apce1091), 0) + NVL(SUM(xrce109), 0) + NVL(SUM(apcf103), 0)
                    )
                    ELSE (
                        NVL(SUM(apcc108), 0) - NVL(SUM(apcc109), 0) + NVL(SUM(t2.apce109), 0) + NVL(SUM(t1.apce1091), 0) + NVL(SUM(xrce109), 0) + NVL(SUM(apcf103), 0)
                    )
                end xrcb105,
                '',
                '',
                '',
                '',
                NVL(SUM(apcc108), 0),
                NVL(SUM(apcc109), 0),
                NVL(SUM(t2.apce109), 0),
                NVL(SUM(t1.apce1091), 0),
                NVL(SUM(xrce109), 0),
                NVL(SUM(apcf103), 0),
                NVL(SUM(apcc118), 0),
                NVL(SUM(apcc119), 0),
                NVL(SUM(t2.apce119), 0),
                NVL(SUM(t1.apce1191), 0),
                NVL(SUM(xrce119), 0),
                NVL(SUM(apcf113), 0),
                apca001,
                case
                    when apca001 like '2%' then -1 *(
                        NVL(SUM(apcc118), 0) - NVL(SUM(apcc119), 0) + NVL(SUM(t2.apce119), 0) + NVL(SUM(t1.apce1191), 0) + NVL(SUM(xrce119), 0) + NVL(SUM(apcf113), 0)
                    )
                    when apca001 in ('02', '04', '06') then -1 *(
                        NVL(SUM(apcc118), 0) - NVL(SUM(apcc119), 0) + NVL(SUM(t2.apce119), 0) + NVL(SUM(t1.apce1191), 0) + NVL(SUM(xrce119), 0) + NVL(SUM(apcf113), 0)
                    )
                    else NVL(SUM(apcc118), 0) - NVL(SUM(apcc119), 0) + NVL(SUM(t2.apce119), 0) + NVL(SUM(t1.apce1191), 0) + NVL(SUM(xrce119), 0) + NVL(SUM(apcf113), 0)
                end l_sum
            FROM apca_t
                LEFT OUTER JOIN apcc_t ON apcaent = apccent
                AND apcald = apccld
                AND apcadocno = apccdocno
                left join (
                    SELECT glaqdocno,
                        glaq002,
                        NVL(
                            SUM(
                                CASE
                                    WHEN glaq003 = 0 THEN glaq010 * -1
                                    ELSE glaq010
                                END
                            ),
                            0
                        ) glaq010,
                        NVL(SUM(glaq003 - glaq004), 0) glaq003
                    FROM glaq_t
                    WHERE glaqent = 1
                        AND glaqld = '10'
                    group by glaqdocno,
                        glaq002
                ) on glaqdocno = apca038
                and glaq002 = apca035
                LEFT JOIN glac_t on glacent = 1
                and glac001 = '10'
                and glac002 = apca035
                LEFT join glacl_t ON glaclent = 1
                AND glacl001 = '10'
                AND glacl002 = apca035
                LEFT JOIN oobx_t on oobxent = 1
                and oobx001 = substr(apcadocno, 0, 4)
                LEFT OUTER JOIN(
                    SELECT apce003,
                        apce004,
                        apce005,
                        SUM(apce109) apce1091,
                        SUM(apce119) apce1191
                    FROM apce_t,
                        apca_t
                    WHERE apceent = apcaent
                        AND apceld = apcald
                        AND apcedocno = apcadocno
                        AND apcaent = 1
                        AND apcastus = 'Y'
                    GROUP BY apce003,
                        apce004,
                        apce005
                ) t1 ON apccdocno = t1.apce003
                AND apccseq = t1.apce004
                AND apcc001 = t1.apce005
                LEFT OUTER JOIN(
                    SELECT apce003,
                        apce004,
                        apce005,
                        SUM(apce109) apce109,
                        SUM(apce119) apce119
                    FROM apce_t,
                        apda_t
                    WHERE apceent = apdaent
                        AND apceld = apdald
                        AND apcedocno = apdadocno
                        AND apceent = 1
                        AND apdastus = 'Y'
                    GROUP BY apce003,
                        apce004,
                        apce005
                ) t2 ON apccdocno = t2.apce003
                AND apccseq = t2.apce004
                AND apcc001 = t2.apce005
                LEFT OUTER JOIN(
                    SELECT xrce003,
                        xrce004,
                        xrce005,
                        SUM(xrce109) xrce109,
                        SUM(xrce119) xrce119
                    FROM xrce_t,
                        xrda_t
                    WHERE xrceent = xrdaent
                        AND xrceld = xrdald
                        AND xrcedocno = xrdadocno
                        AND xrceent = 1
                        AND xrdastus = 'Y'
                    GROUP BY xrce003,
                        xrce004,
                        xrce005
                ) ON apccdocno = xrce003
                AND apccseq = xrce004
                AND apcc001 = xrce005
                LEFT OUTER JOIN(
                    SELECT apcf008,
                        apcf009,
                        apcf010,
                        SUM(apcf103) apcf103,
                        SUM(apcf113) apcf113
                    FROM apcf_t,
                        apca_t
                    WHERE apcfent = apcaent
                        AND apcfld = apcald
                        AND apcfent = 1
                        AND apcfdocno = apcadocno
                    GROUP BY apcf008,
                        apcf009,
                        apcf010
                ) ON apccdocno = apcf008
                AND apccseq = apcf009
                AND apcc001 = apcf010
                left join TT69331251_AGLQ510_TMP on glar001 = apca035
                AND glar009 = apca100
                AND sys IN ('2')
                AND diff NOT IN('0', '5')
                LEFT JOIN (
                    SELECT unique xrea005,
                        xrea006,
                        xrea007
                    FROM xrea_t
                    WHERE xreaent = 1
                        and xreald = '10'
                        and (  xrea001 < '  2021' OR
                               (xrea001 = '  2021'
                                AND xrea002 < '     6')
                        )
                        AND xrea003 = 'AP'
                ) ON xrea005 = apccdocno
                AND xrea006 = apccseq
                AND xrea007 = apcc001
            WHERE apcaent = 1
                AND apcald = '10'
                AND (
                    apcadocdt BETWEEN to_date('21/06/01', 'yy/mm/dd') AND to_date('21/06/30', 'yy/mm/dd')
                    OR xrea005 is not null
                )
                AND apcastus <> 'X'
                --and  glaqdocno='GL00-01-2010001178'
                AND apca001 NOT IN('21', '23', '24', '25', '26')
                   and glar001 is not null
                and apca038 is not null 
            GROUP BY apca035,
                glacl004,
                apca100,
                apca038,
                glac008,
                glaq010,
                glaq003,
                apcadocno,
                oobx004,
                apca001
        )
    WHERE l_sum <> 0
        AND l_sum <> glaq003