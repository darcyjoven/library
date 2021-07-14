--  LIXWZ_XCNB_p1
MERGE INTO LIXWZ_XCNB t1 USING (
    SELECT A.xcnaent,
        A.xcnadocno,
        A.xcna002,
        A.xcna003,
        A.xcna006,
        A.xcna007,
        B.xcnb003,
        B.xcnb004,
        B.xcnb012,
        B.xcnb013,
        C.xcna006 xcna006_sum,
        C.xcna007 xcna007_sum,
        B.xcnbseq
    FROM LIXWZ_XCNA A,
        LIXWZ_XCNB B,
        (
            -- 根据主 查元件汇总 的主 数量
            SELECT xcnbent,
                xcnbdocno,
                xcnb003,
                xcnb004,
                SUM(xcna006) xcna006,
                SUM(xcna007) xcna007
            FROM LIXWZ_XCNA,
                LIXWZ_XCNB
            WHERE xcnbdocno = 'NT-F10-210645032'
                AND xcnbent = 72
                AND xcnadocno = xcnbdocno
                AND xcnaent = xcnbent
                AND xcna003 = xcnb002
            GROUP BY xcnbent,
                xcnbdocno,
                xcnb003,
                xcnb004
        ) C
    WHERE A.xcnadocno = B.xcnbdocno
        AND A.xcnaent = B.xcnbent
        AND A.xcna002 = B.xcnb001
        AND A.xcna003 = B.xcnb002
        AND A.xcnadocno = C.xcnbdocno
        AND A.xcnaent = C.xcnbent
        AND B.xcnb003 = C.xcnb003
        AND B.xcnb004 = C.xcnb004
        AND A.xcnaent = 72
        AND A.xcnadocno = 'NT-F10-210645032'
) t2 ON (
    t1.xcnbdocno = t2.xcnadocno
    AND t1.xcnbent = t2.xcnaent
    AND t1.xcnb001 = t2.xcna002
    AND COALESCE(t1.xcnb002, ' ') = COALESCE(t2.xcna003, ' ')
    AND t1.xcnb003 = t2.xcnb003
    AND COALESCE(t1.xcnb004, ' ') = COALESCE(t2.xcnb004, ' ')
    AND t1.xcnbseq = t2.xcnbseq
)
WHEN MATCHED THEN
UPDATE
SET t1.xcnb012 = CASE
        WHEN t2.xcna006_sum = 0 THEN 0
        ELSE NVL(t1.xcnb012 * t2.xcna006 / t2.xcna006_sum, 0)
    END,
    t1.xcnb013 = CASE
        WHEN t2.xcna006_sum = 0 THEN 0
        ELSE NVL(t1.xcnb013 * t2.xcna006 / t2.xcna006_sum, 0)
    END  


select sum(xcna006) xcna006_sum FROM FROM LIXWZ_XCNA,
                LIXWZ_XCNB WHERE xcnbdocno = 'NT-F10-210645032'
                AND xcnbent = 72
                AND xcnadocno = xcnbdocno
                AND xcnaent = xcnbent
                AND xcna003 = xcnb002
                AND 