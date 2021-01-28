## **表被drop掉**

```sql
select object_name,original_name,partition_name,type,ts_name,createtime,droptime from recyclebin;
```

#### 根据original_name查询删掉的表

```sql
flashback table test_drop to before drop;或
flashback table "BIN$hgcd$0" to before drop;
```



