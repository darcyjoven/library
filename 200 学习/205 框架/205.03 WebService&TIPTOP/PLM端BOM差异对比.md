> plm 用这个导出sql 格式文件。
```sql
SELECT
 end1.id 父阶id,
 end1.REVISIONID 父阶版本,
 end2.id 子阶id,
 end2.REVISIONID 子阶版本,
 bs."SEQUENCE" 顺序号,
 bs.QUANTITY 用量,
 bs.rsflag 取替代
FROM
 BOMVIEW_R bv ,
 BOMSTRUCTURE bs,
 MA_FOUNDATION end1,
 MA_FOUNDATION end2
WHERE
 bs.VIEWFK = bv.FOUNDATIONFK
 AND end1.GUID = bv.END1
 AND end1.LATESTREVISION LIKE '%mr%'
 AND bs.END2MASTERGUID = end2.MASTERFK
 AND end2.LATESTREVISION LIKE '%m%';
```
文件内容是这样的
 
```sql
insert into BOMVIEW_R (父阶ID, 父阶版本, 子阶ID, 子阶版本, 顺序号, 用量, 取替代)
values ('7310-060003001', 'A', '4231-000000001', 'C', '0030', 4, '');
insert into BOMVIEW_R (父阶ID, 父阶版本, 子阶ID, 子阶版本, 顺序号, 用量, 取替代)
values ('9111-060003002', 'A', '6411-060003001', 'A', '0070', 1, '');
```


>  通过sqlplus 连接到ERP数据库后台导入这个文件
要事先建立下BOMVIEW_R这个表。

用plsql 导入，资料大的话会卡死

文件名 `plm210506.sql` `sqlplus` 后运行命令`@plm210506.sql`

结束之后记得运行commit 命令提交

> 对比bmb_file 资料和 BOMVIEW_R 差异
比如下面这个sql 比对PLM有，ERP没有的资料

```sql
SELECT * FROM BOMVIEW_R
LEFT JOIN  bmb_file ON bmb01 =父阶id  AND bmb03 = 子阶id
WHERE 取替代 <>'Y' AND bmb01 IS NULL;
```