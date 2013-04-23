set pagesize 0;
spool e:\oracle11g\analyze_tables.sql;
select 'analyze table '||owner||'.'||table_name||' compute statistics;' from dba_tables where owner='SYSTEM';
spool off;
spool e:\oracle11g\analyze_index.sql;
select 'analyze index '||owner||'.'||index_name||' compute statistics;' from dba_indexes where owner='SYSTEM';
spool off;
@e:\oracle11g\analyze_tables.sql;
@e:\oracle11g\analyze_index.sql;



spool e:\oracle11g\analyze_tables.sql;
select 'analyze table '||owner||'.'||table_name||' compute statistics;' from dba_tables where owner='APPUSER';
spool off;
spool e:\oracle11g\analyze_index.sql;
select 'analyze index '||owner||'.'||index_name||' compute statistics;' from dba_indexes where owner='APPUSER';
spool off;
@e:\oracle11g\analyze_tables.sql;
@e:\oracle11g\analyze_index.sql;


spool e:\oracle11g\analyze_tables.sql;
select 'analyze table '||owner||'.'||table_name||' compute statistics;' from dba_tables where owner='EQPUSER';
spool off;
spool e:\oracle11g\analyze_index.sql;
select 'analyze index '||owner||'.'||index_name||' compute statistics;' from dba_indexes where owner='EQPUSER';
spool off;
@e:\oracle11g\analyze_tables.sql;
@e:\oracle11g\analyze_index.sql;


spool e:\oracle11g\analyze_tables.sql;
select 'analyze table '||owner||'.'||table_name||' compute statistics;' from dba_tables where owner='EBUSER';
spool off;
spool e:\oracle11g\analyze_index.sql;
select 'analyze index '||owner||'.'||index_name||' compute statistics;' from dba_indexes where owner='EBUSER';
spool off;
@e:\oracle11g\analyze_tables.sql;
@e:\oracle11g\analyze_index.sql;

exit;