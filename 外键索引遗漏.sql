当前用户创建外键索引脚本：
 SELECT X.T,  
         X.C,  
         UPPER('create index ' || 'idx_' || X.T || '_' || X.C || ' on ' || X.T || '(' || X.C || ');') SQLS  
    FROM (SELECT C.TABLE_NAME T, C.COLUMN_NAME C  
            FROM USER_CONS_COLUMNS C, USER_CONSTRAINTS UC  
           WHERE C.TABLE_NAME = UC.TABLE_NAME  
             AND C.CONSTRAINT_NAME = UC.CONSTRAINT_NAME  
             AND UC.CONSTRAINT_TYPE = 'R'  
             AND UC.STATUS = 'ENABLED'  
          MINUS  
          SELECT UI.TABLE_NAME T, UI.COLUMN_NAME C FROM USER_IND_COLUMNS UI) X    


检查所有用户下外键未建索引脚本
SELECT c.owner,
         c.table_name,
         c.constraint_name,
         cc.column_name,
         c.status
    FROM dba_constraints c, dba_cons_columns cc
   WHERE c.constraint_type = 'R'
         AND c.owner NOT IN
                ('SYS',
                 'SYSTEM',
                 'SYSMAN',
                 'EXFSYS',
                 'WMSYS',
                 'OLAPSYS',
                 'OUTLN',
                 'DBSNMP',
                 'ORDSYS',
                 'ORDPLUGINS',
                 'MDSYS',
                 'CTXSYS',
                 'AURORA$ORB$UNAUTHENTICATED',
                 'XDB',
                 'FLOWS_030000',
                 'FLOWS_FILES')
         AND c.owner = cc.owner
         AND c.constraint_name = cc.constraint_name
         AND NOT EXISTS
                    (SELECT 'x'
                       FROM dba_ind_columns ic
                      WHERE     cc.owner = ic.table_owner
                            AND cc.table_name = ic.table_name
                            AND cc.column_name = ic.column_name
                            AND cc.position = ic.column_position
                            AND NOT EXISTS
                                       (SELECT owner, index_name
                                          FROM dba_indexes i
                                         WHERE     i.table_owner = c.owner
                                               AND i.index_Name = ic.index_name
                                               AND i.owner = ic.index_owner
                                               AND (i.status = 'UNUSABLE'
                                                    OR i.partitioned = 'YES'
                                                       AND EXISTS
                                                              (SELECT 'x'
                                                                 FROM dba_ind_partitions ip
                                                                WHERE status =
                                                                         'UNUSABLE'
                                                                      AND ip.
                                                                           index_owner =
                                                                             i.
                                                                              owner
                                                                      AND ip.
                                                                           index_Name =
                                                                             i.
                                                                              index_name
                                                               UNION ALL
                                                               SELECT 'x'
                                                                 FROM dba_ind_subpartitions isp
                                                                WHERE status =
                                                                         'UNUSABLE'
                                                                      AND isp.
                                                                           index_owner =
                                                                             i.
                                                                              owner
                                                                      AND isp.
                                                                           index_Name =
                                                                             i.
                                                                              index_name))))
ORDER BY c.owner,c.table_name
/