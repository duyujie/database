CONN / AS SYSDBA

-- show parameter target
ALTER SYSTEM SET MEMORY_MAX_TARGET=8G SCOPE = SPFILE;
ALTER SYSTEM SET MEMORY_TARGET=4G SCOPE=SPFILE;
ALTER SYSTEM SET PGA_AGGREGATE_TARGET=0 SCOPE=SPFILE;
ALTER SYSTEM SET SGA_TARGET=0 SCOPE=SPFILE;

--alter SYSTEM set deferred_segment_creation=false;

alter system set sort_area_size=1048576 scope=spfile;

alter system set processes=2000 scope=spfile;
alter system set sessions=2500 scope=spfile;


--alter system set dispatchers = '(protocol=tcp)(dispatchers=3)(service=cossuite)';
alter system set shared_servers=0 scope=both;
alter system set max_shared_servers=0 scope=both;
alter system set dispatchers='';

create pfile from spfile;

alter profile default limit password_life_time unlimited;

-- Restart instance.
SHUTDOWN IMMEDIATE;
STARTUP;

Select USERNAME,server, COUNT(*) From v$session GROUP BY USERNAME,server;

在listener.ora文件中增加下面的内容：
#----ADDED BY TNSLSNR---
LOGGING_LISTENER = OFF
#--------------------------------------------


