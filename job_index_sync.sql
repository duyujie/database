-- sync :
-- every 1 miniutes

VARIABLE jobno number;

BEGIN

DBMS_JOB.SUBMIT(:jobno,'ctx_ddl.sync_index(''IDX_ARC_SRC'');',

SYSDATE, 'SYSDATE + (1/24/60)');

commit;

END;

 /

-- optimizer

VARIABLE jobno number;

BEGIN

DBMS_JOB.SUBMIT(:jobno,'ctx_ddl.optimize_index(''IDX_ARC_SRC'',''FULL'');',

SYSDATE, 'SYSDATE + 1');

commit;

  END;