Create Directory Dmpdir As 'E:\Backup\Database'
/
grant read,write on Directory Dmpdir to system
/

--del E:\backup\database\%date:~7,2%FULL.DMP
expdp system/Cossuite_123 DUMPFILE=%date:~7,2%FULL.DMP DIRECTORY=Dmpdir FULL=Y
--expdp system/Cossuite_123 DUMPFILE=appuser.DMP DIRECTORY=Dmpdir schemas=appuser  EXCLUDE=TABLE:\"IN ('FRM_SVC_MONITOR_EVENT')\"
--expdp system/Cossuite_123 DUMPFILE=eqpuser.DMP DIRECTORY=Dmpdir schemas=eqpuser
--expdp system/Cossuite_123 DUMPFILE=ebuser.DMP DIRECTORY=Dmpdir schemas=ebuser

--set path=%path%;C:\Program Files\HaoZip
--HaoZipC a -tzip  \\192.168.100.3\e$\backup\database\%date:~7,2%FULL.DMP.zip E:\backup\database\%date:~7,2%FULL.DMP
--del  E:\backup\database\%date:~7,2%FULL.DMP

impdp system/Cossuite_123 directory=Dmpdir full=y dumpfile=30FULL.DMP table_exists_action=replace

impdp system/Cossuite_123 directory=Dmpdir DUMPFILE=16FULL.DMP schemas=appuser table_exists_action=replace
impdp system/Cossuite_123 directory=Dmpdir DUMPFILE=16FULL.DMP schemas=eqpuser table_exists_action=replace
impdp system/Cossuite_123 directory=Dmpdir DUMPFILE=16FULL.DMP schemas=ebuser table_exists_action=replace

impdp system/Cossuite_123 directory=Dmpdir DUMPFILE=18FULL.DMP schemas=appuser REMAP_SCHEMA=appuser:ind_appuser table_exists_action=replace



impdp system/Cossuite_123 directory=Dmpdir DUMPFILE=16FULL.DMP schemas=appuser table_exists_action=replace EXCLUDE=TABLE:\"IN ('FRM_SVC_MONITOR_EVENT')\"
expdp system/Cossuite_123 directory=Dmpdir DUMPFILE=27IND_APPUSER.DMP schemas=ind_appuser EXCLUDE=TABLE:\"IN ('FRM_SVC_MONITOR_EVENT')\"

expdp system/Cossuite_123 DUMPFILE=0220Mal.DMP DIRECTORY=Dmpdir schemas=mal_appuser
impdp system/Cossuite_123 directory=Dmpdir DUMPFILE=0220Mal.DMP schemas=mal_appuser REMAP_SCHEMA=mal_appuser:ind_appuser table_exists_action=replace





说明：
REMAP_SCHEMA可以定义用户的切换，其格式为：
remap_schema=old_schema_name:new_schema_name

REMAP_TABLESPACE可以定义切换对象的不同表空间，其格式为：
remap_tablespace=old_tablespace_name:new_tablespace_name
 
在使用impdp时，会发现，有很多参数选项与imp不同，比如说，找不到了fromuser和touser参数，也找不到了ignore参数，indexes等参数也不再存在。

当然这些功能都还在，而且更加强大，impdp有了不少新的替代参数。
以下三个参数极大的增强了用户转换及表空间转换的操作：
REMAP_DATAFILE        Redefine datafile references in all DDL statements.
REMAP_SCHEMA          Objects from one schema are loaded into another schema.
REMAP_TABLESPACE      Tablespace object are remapped to another tablespace.

REMAP_SCHEMA可以定义用户的切换，其格式为：
remap_schema=old_schema_name:new_schema_name

REMAP_TABLESPACE可以定义切换对象的不同表空间，其格式为：
remap_tablespace=old_tablespace_name:new_tablespace_name

以前类似IGNORE的忽略创建错误，可以使用CONTENT参数：
CONTENT               Specifies data to load where the valid keywords are:
                              (ALL), DATA_ONLY, and METADATA_ONLY.

如果数据结构已经存在可以指定CONTENT=DATA_ONLY，仅导入数据。

而关于索引的排除，可以使用EXCLUDE参数：
EXCLUDE               Exclude specific object types, e.g. EXCLUDE=TABLE:EMP.

IMPDP导入时忽略索引可以使用类似： EXCLUDE=CONSTRAINT EXCLUDE=INDEX