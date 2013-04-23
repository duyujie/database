ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED
/

create role APPROLE
/
grant connect,resource,create session,create view,create procedure,execute any procedure,
create TABLE,create INDEXTYPE,create SEQUENCE,create CLUSTER,create TYPE,create OPERATOR,
CREATE ANY CONTEXT, CREATE ANY TRIGGER ,DEBUG ANY PROCEDURE,DEBUG CONNECT SESSION，
CREATE MATERIALIZED VIEW
to APPROLE
/

 
GRANT EXECUTE ON SYS.DBMS_DEBUG_JDWP TO APPROLE
/
 




/* create user appuser */
create user "APPUSER" identified by "appuser_123" default tablespace SUITESPACE Temporary TABLESPACE SUITETEMP
/
 /* change user password */
--alter user appuser identified by "appuser_123";

-- USER SQL
ALTER USER "APPUSER" 
DEFAULT TABLESPACE "SUITESPACE"
TEMPORARY TABLESPACE "SUITETEMP"
ACCOUNT UNLOCK
/
alter user APPUSER quota unlimited on SUITESPACE
/
alter user APPUSER quota unlimited on SUITELOBS
/

grant APPROLE to APPUSER
/
 
-- SYSTEM PRIVILEGES

-- QUOTAS


/* create user poc */
create user poc identified by "poc" default tablespace SUITESPACE Temporary TABLESPACE SUITETEMP
/
alter user poc quota unlimited on SUITESPACE
/
-- ROLES
grant APPROLE to poc
/

/* create user eqpuser */

create user eqpuser identified by "eqpuser_123" default tablespace SUITESPACE Temporary TABLESPACE SUITETEMP;
/* change user password */
--alter user eqpuser identified by "eqpuser_123";

-- USER SQL
ALTER USER eqpuser 
DEFAULT TABLESPACE "SUITESPACE"
TEMPORARY TABLESPACE "SUITETEMP"
ACCOUNT UNLOCK 
/

alter user eqpuser quota unlimited on SUITESPACE
/
alter user eqpuser quota unlimited on SUITELOBS
/
-- ROLES
grant APPROLE to eqpuser
/



/* create user ebuser */

create user ebuser identified by "ebuser_123" default tablespace SUITESPACE Temporary TABLESPACE SUITETEMP;
/* change user password */
--alter user ebuser identified by "ebuser_123";

-- USER SQL
ALTER USER ebuser 
DEFAULT TABLESPACE "SUITESPACE"
TEMPORARY TABLESPACE "SUITETEMP"
ACCOUNT UNLOCK
/

alter user ebuser quota unlimited on SUITESPACE
/
alter user ebuser quota unlimited on SUITELOBS
/

-- ROLES
grant APPROLE to ebuser
/


select 'grant select on APPUSER.'||t.table_name||' to IND_EBUSER;' from dba_tables t where t.owner='APPUSER'
/
