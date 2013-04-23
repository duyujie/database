/* create tablespace SUITESPACE */
CREATE TABLESPACE SUITESPACE DATAFILE 'E:\oracle11g\oradata\cossuite\SUITESPACE.DBF' SIZE 5g AUTOEXTEND  ON NEXT 2g MAXSIZE unlimited; 
--CREATE TABLESPACE SUITESPACE DATAFILE 'E:\oracle11g\oradata\cossuite\SUITESPACE.DBF' SIZE 2g AUTOEXTEND  ON NEXT 1g MAXSIZE 10g segment space management auto;
--ALTER TABLESPACE SUITESPACE add DATAFILE 'E:\oracle11g\oradata\cossuite\SUITESPACE2.DBF' SIZE 10g;
ALTER DATABASE DEFAULT TABLESPACE SUITESPACE;

/* create temp tablespace SUITETEMP */
CREATE temporary TABLESPACE SUITETEMP TEMPFILE 'E:\oracle11g\oradata\cossuite\SUITETEMP.DBF' size 2g;
CREATE temporary TABLESPACE SUITETEMP2 TEMPFILE 'E:\oracle11g\oradata\cossuite\SUITETEMP2.DBF' size 2g;

/* create tablespace SUITELOBS for lobs */
CREATE TABLESPACE SUITELOBS DATAFILE 'E:\oracle11g\oradata\cossuite\SUITELOBS.DBF' SIZE 2g  AUTOEXTEND  ON NEXT 500m MAXSIZE 10g segment space management auto;


/* create undo tablespace */
create undo tablespace SUITEUNDO datafile 'E:\oracle11g\oradata\cossuite\SUITEUNDO.DBF' size 500m;
create undo tablespace SUITEUND1 datafile 'E:\oracle11g\oradata\cossuite\SUITEUND1.DBF' size 500m;
create undo tablespace SUITEUND2 datafile 'E:\oracle11g\oradata\cossuite\SUITEUND2.DBF' size 500m;

