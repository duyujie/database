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





˵����
REMAP_SCHEMA���Զ����û����л������ʽΪ��
remap_schema=old_schema_name:new_schema_name

REMAP_TABLESPACE���Զ����л�����Ĳ�ͬ��ռ䣬���ʽΪ��
remap_tablespace=old_tablespace_name:new_tablespace_name
 
��ʹ��impdpʱ���ᷢ�֣��кܶ����ѡ����imp��ͬ������˵���Ҳ�����fromuser��touser������Ҳ�Ҳ�����ignore������indexes�Ȳ���Ҳ���ٴ��ڡ�

��Ȼ��Щ���ܶ����ڣ����Ҹ���ǿ��impdp���˲����µ����������
�������������������ǿ���û�ת������ռ�ת���Ĳ�����
REMAP_DATAFILE        Redefine datafile references in all DDL statements.
REMAP_SCHEMA          Objects from one schema are loaded into another schema.
REMAP_TABLESPACE      Tablespace object are remapped to another tablespace.

REMAP_SCHEMA���Զ����û����л������ʽΪ��
remap_schema=old_schema_name:new_schema_name

REMAP_TABLESPACE���Զ����л�����Ĳ�ͬ��ռ䣬���ʽΪ��
remap_tablespace=old_tablespace_name:new_tablespace_name

��ǰ����IGNORE�ĺ��Դ������󣬿���ʹ��CONTENT������
CONTENT               Specifies data to load where the valid keywords are:
                              (ALL), DATA_ONLY, and METADATA_ONLY.

������ݽṹ�Ѿ����ڿ���ָ��CONTENT=DATA_ONLY�����������ݡ�

�������������ų�������ʹ��EXCLUDE������
EXCLUDE               Exclude specific object types, e.g. EXCLUDE=TABLE:EMP.

IMPDP����ʱ������������ʹ�����ƣ� EXCLUDE=CONSTRAINT EXCLUDE=INDEX