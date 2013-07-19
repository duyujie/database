
/*==============================================================*/
/* System's Global tables for framework                         */
/*==============================================================*/ 

 create table SYSTEM.GLOBAL_CARRIERS  (
   GLOBAL_CARRIERS_UUID CHAR(32)                        not null,
   CARRIER_CODE         VARCHAR2(10),
   CARRIER_NAME_KEY     VARCHAR2(20),
   CARRIER_SERVER_URL   VARCHAR2(200),
   BL_PREFIX            VARCHAR2(6),
   SCAC_CDE             VARCHAR2(4),
   REC_UPD_DTE          TIMESTAMP                      default SYSTIMESTAMP not null,
   constraint PK_GLOBAL_CARRIERS primary key (GLOBAL_CARRIERS_UUID),
    constraint AK_KEY_NAME_GLOBAL_CARRIERS unique (CARRIER_NAME_KEY)
);


 
   
grant select on SYSTEM.GLOBAL_CARRIERS TO public
/
create or replace view V_GLOBAL_CARRIERS as
select * FROM SYSTEM.GLOBAL_CARRIERS
with read only;
  
 
/*==============================================================*/
/* Table: GLOBAL_SERVICE_NAMESPACE                              */
/*==============================================================*/
create table SYSTEM.GLOBAL_SERVICE_NAMESPACE  (
   GLOBAL_SERVICE_NAMESPACE_UUID CHAR(32)                        not null,
   GLOBAL_CARRIERS_UUID CHAR(32)                        not null,
   SERVICE_NAMESPACE    VARCHAR2(20)                    not null,
   SERVICE_URL          VARCHAR2(200)                   not null,
   REC_UPD_DTE          TIMESTAMP                      default SYSTIMESTAMP not null,
   constraint PK_GLOBAL_SERVICE_NAMESPACE primary key (GLOBAL_SERVICE_NAMESPACE_UUID),
   constraint AK_KEY_NAME_GLOBAL_SERVICE unique (GLOBAL_CARRIERS_UUID, SERVICE_NAMESPACE)
);

alter table SYSTEM.GLOBAL_SERVICE_NAMESPACE
   add constraint FK_GLOBAL_S_REFERENCE_GLOBAL_C foreign key (GLOBAL_CARRIERS_UUID)
      references SYSTEM.GLOBAL_CARRIERS (GLOBAL_CARRIERS_UUID);
/


GRANT SELECT ON SYSTEM.GLOBAL_SERVICE_NAMESPACE TO PUBLIC;
/

  
Insert into SYSTEM.GLOBAL_CARRIERS (GLOBAL_CARRIERS_UUID,CARRIER_CODE,CARRIER_NAME_KEY,CARRIER_SERVER_URL,BL_PREFIX,SCAC_CDE) 
	values ('c71a36e2e6d54dc286fa90816d2ef37e','COS','carrier.COS.local','http://localhost:8080/ShipSuiteWeb/hessian/', 'COSU','COSU');
Insert into SYSTEM.GLOBAL_CARRIERS (GLOBAL_CARRIERS_UUID,CARRIER_CODE,CARRIER_NAME_KEY,CARRIER_SERVER_URL,BL_PREFIX,SCAC_CDE) 
	values ('c82b059feb004e3b88e4b64a05ebbd2f','COS','carrier.COS.dev','http://atsuit02:8080/ShipSuiteWeb/hessian/','COSU','COSU');
Insert into SYSTEM.GLOBAL_CARRIERS (GLOBAL_CARRIERS_UUID,CARRIER_CODE,CARRIER_NAME_KEY,CARRIER_SERVER_URL,BL_PREFIX,SCAC_CDE) 
	values ('2721d2e96ae54d62b32c485d093d798d','COS','carrier.COS.suit01','http://suit01:80/ShipSuiteWeb/hessian/','COSU','COSU');
Insert into SYSTEM.GLOBAL_CARRIERS (GLOBAL_CARRIERS_UUID,CARRIER_CODE,CARRIER_NAME_KEY,CARRIER_SERVER_URL,BL_PREFIX,SCAC_CDE) 
	values ('1721d2e96ae54d62b32c485d093d798f','POS','carrier.POS','http://atsuit02:8080/ShipSuiteWebPos/hessian/','PSHY','PSHY');

commit;

create or replace view  V_GLOBAL_CARRIERS
AS
SELECT * FROM SYSTEM.GLOBAL_CARRIERS;
/

 

create or replace view V_GLOBAL_SERVICE_NAMESPACE as
select * FROM SYSTEM.GLOBAL_SERVICE_NAMESPACE;
/
 
 


  DROP TABLE "POOLED_KEY" cascade constraints;
--------------------------------------------------------
--  DDL for Table POOLED_KEY
--------------------------------------------------------

  CREATE TABLE "POOLED_KEY" 
   (	"POOLED_KEY_UUID" VARCHAR2(50 BYTE), 
	"KEY_NAME" VARCHAR2(50 BYTE), 
	"KEY_VALUE" NUMBER(22,0) DEFAULT 0, 
	"KEY_INTERVAL" NUMBER(9,0) DEFAULT 1, 
	"KEY_POOL_SIZE" NUMBER(9,0) DEFAULT 1, 
	"REC_UPD_DTE" TIMESTAMP (6) DEFAULT SYSTIMESTAMP
   ) ;
--------------------------------------------------------
--  DDL for Index UINDEX_POOLED_KEY
--------------------------------------------------------

  CREATE UNIQUE INDEX "UINDEX_POOLED_KEY" ON "POOLED_KEY" ("KEY_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C0011628
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C0011628" ON "POOLED_KEY" ("POOLED_KEY_UUID") 
  ;
--------------------------------------------------------
--  Constraints for Table POOLED_KEY
--------------------------------------------------------

  ALTER TABLE "POOLED_KEY" ADD CONSTRAINT "SYS_C0011628" PRIMARY KEY ("POOLED_KEY_UUID") ENABLE;
 
  ALTER TABLE "POOLED_KEY" MODIFY ("POOLED_KEY_UUID" NOT NULL ENABLE);
 
  ALTER TABLE "POOLED_KEY" MODIFY ("KEY_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "POOLED_KEY" MODIFY ("KEY_VALUE" NOT NULL ENABLE);
 
  ALTER TABLE "POOLED_KEY" MODIFY ("KEY_INTERVAL" NOT NULL ENABLE);
 
  ALTER TABLE "POOLED_KEY" MODIFY ("KEY_POOL_SIZE" NOT NULL ENABLE);
 
  ALTER TABLE "POOLED_KEY" MODIFY ("REC_UPD_DTE" NOT NULL ENABLE);



--------------------------------------------------------
--  Security tables
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "V_DATA_ACCESS_UNIT" AS 
  SELECT GSP_TERR_UUID as DATA_ACCESS_UNIT_UUID,NULL as DATA_ACCESS_UNIT_PARENT,GSP_TERR_CDE as DATA_ACCESS_CODE,GSP_TERR_NME as DATA_ACCESS_NAME,GSP_TERR_CN_NME as DATA_ACCESS_CN_NAME,'Territory' as DATA_ACCESS_LEVEL,REC_UPD_DT,REC_UPD_USER_ID 
  FROM GSP_TERRITORY
UNION ALL
SELECT GSP_REGION_UUID as DATA_ACCESS_UNIT_UUID,GSP_TERR_UUID as DATA_ACCESS_UNIT_PARENT,GSP_REGION_CDE as DATA_ACCESS_CODE,GSP_REGION_NME as DATA_ACCESS_NAME,GSP_REGION_CN_NME as DATA_ACCESS_CN_NAME,'Region' as DATA_ACCESS_LEVEL,REC_UPD_DT,REC_UPD_USER_ID 
  FROM GSP_REGION
UNION ALL
SELECT GSP_OFCE_UUID as DATA_ACCESS_UNIT_UUID,GSP_REGION_UUID as DATA_ACCESS_UNIT_PARENT,GSP_OFCE_CDE as DATA_ACCESS_CODE,GSP_OFCE_NME as DATA_ACCESS_NAME,GSP_OFCE_CN_NME as DATA_ACCESS_CN_NAME,'Office' as DATA_ACCESS_LEVEL,REC_UPD_DT,REC_UPD_USER_ID 
  FROM GSP_OFFICE
with read only;

/*
  CREATE OR REPLACE FORCE VIEW "V_DATA_ACCESS_UNIT" AS 
  SELECT '' as DATA_ACCESS_UNIT_UUID,NULL as DATA_ACCESS_UNIT_PARENT,NULL as DATA_ACCESS_CODE,NULL as DATA_ACCESS_NAME,NULL as DATA_ACCESS_CN_NAME,'Territory' as DATA_ACCESS_LEVEL,sysdate as REC_UPD_DT,'system' as REC_UPD_USER_ID 
  FROM dual 
with read only;
*/
 

--------------------------------------------------------
--  文件已创建 - 星期四-四月-19-2012   
--------------------------------------------------------
  DROP TABLE "DATA_ACCESS_SCOPE" cascade constraints;
  DROP TABLE "DATA_ACCESS_SCOPE_UNIT" cascade constraints;
  DROP TABLE "DATA_ACCESS_USER" cascade constraints;
  DROP TABLE "GROUP_UNIT" cascade constraints;
  DROP TABLE "ROLE_UNIT" cascade constraints;
  DROP TABLE "FRM_ACTION" cascade constraints;
  DROP TABLE "FRM_ACTION_GROUP" cascade constraints;
  DROP TABLE "FRM_FUNCTION" cascade constraints;
  DROP TABLE "FRM_SUBSYSTEM" cascade constraints;
--------------------------------------------------------
--  DDL for Table DATA_ACCESS_SCOPE
--------------------------------------------------------

  CREATE TABLE "DATA_ACCESS_SCOPE" 
   (	"DATA_ACCESS_SCOPE_UUID" CHAR(32), 
	"HIERARCHY_TYPE" VARCHAR2(20), 
	"DATA_ACCESS_LEVEL" VARCHAR2(20), 
	"REC_UPD_DT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"REC_UPD_USER_ID" VARCHAR2(16), 
	"GSP_OFCE_CDE" CHAR(3), 
	"USER_ID" VARCHAR2(16)
   ) ;
--------------------------------------------------------
--  DDL for Table DATA_ACCESS_SCOPE_UNIT
--------------------------------------------------------

  CREATE TABLE "DATA_ACCESS_SCOPE_UNIT" 
   (	"DATA_ACCESS_SCOPE_UNIT_UUID" CHAR(32), 
	"DATA_ACCESS_SCOPE_UUID" CHAR(32), 
	"DATA_ACCESS_UNIT_UUID" CHAR(32), 
	"REC_UPD_DT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"REC_UPD_USER_ID" VARCHAR2(16)
   ) ;
--------------------------------------------------------
--  DDL for Table DATA_ACCESS_USER
--------------------------------------------------------

  CREATE TABLE "DATA_ACCESS_USER" 
   (	"USER_ID" VARCHAR2(16), 
	"ROLE_CODES" CLOB, 
	"GROUP_CODES" CLOB, 
	"REC_UPD_DTE" TIMESTAMP (6), 
	"REC_UPD_USER_ID" VARCHAR2(16)
   ) ;
--------------------------------------------------------
--  DDL for Table GROUP_UNIT
--------------------------------------------------------

  CREATE TABLE "GROUP_UNIT" 
   (	"GROUP_UNIT_UUID" CHAR(32), 
	"CODE" VARCHAR2(100), 
	"NAME" VARCHAR2(200), 
	"ROLE_CODES" CLOB, 
	"REC_UPD_DT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"REC_UPD_USER_ID" VARCHAR2(16), 
	"SUB_GROUP_CODES" CLOB
   ) ;
--------------------------------------------------------
--  DDL for Table FRM_ACTION
--------------------------------------------------------

  CREATE TABLE "FRM_ACTION" 
   (	"FRM_ACTION_UUID" CHAR(32), 
	"FRM_ACTION_GROUP_UUID" CHAR(32), 
	"FRM_ACTION_ID" VARCHAR2(200), 
	"IS_PUBLIC" NUMBER(1,0) DEFAULT 0, 
	"REC_UPD_DT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"REC_UPD_USER_ID" VARCHAR2(16)
   ) ;
--------------------------------------------------------
--  DDL for Table FRM_ACTION_GROUP
--------------------------------------------------------

  CREATE TABLE "FRM_ACTION_GROUP" 
   (	"FRM_ACTION_GROUP_UUID" CHAR(32), 
	"FRM_ACTION_GROUP_ID" VARCHAR2(200), 
	"REC_UPD_DT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"REC_UPD_USER_ID" VARCHAR2(16)
   ) ;
--------------------------------------------------------
--  DDL for Table FRM_FUNCTION
--------------------------------------------------------

  CREATE TABLE "FRM_FUNCTION" 
   (	"FRM_FUNCTION_UUID" CHAR(32), 
	"FRM_FUNCTION_ID" VARCHAR2(200), 
	"FRM_SUBSYSTEM_UUID" CHAR(32), 
	"FRM_ACTION_GROUP_UUID" CHAR(32), 
	"FRM_FUNCTION_PARAM" VARCHAR2(200),
	"REC_UPD_DT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"REC_UPD_USER_ID" VARCHAR2(16)
   ) ;
--------------------------------------------------------
--  DDL for Table FRM_SUBSYSTEM
--------------------------------------------------------

  CREATE TABLE "FRM_SUBSYSTEM" 
   (	"FRM_SUBSYSTEM_UUID" CHAR(32), 
	"FRM_SUBSYSTEM_ID" VARCHAR2(200), 
	"FRM_SYSTEM_ID" VARCHAR2(200) NOT NULL,
	"REC_UPD_DT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"REC_UPD_USER_ID" VARCHAR2(16)
   ) ;
--------------------------------------------------------
--  DDL for Table ROLE_UNIT
--------------------------------------------------------

  CREATE TABLE "ROLE_UNIT" 
   (	"ROLE_UNIT_UUID" CHAR(32), 
	"CODE" VARCHAR2(4000), 
	"NAME" VARCHAR2(200), 
	"REC_UPD_DT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"REC_UPD_USER_ID" VARCHAR2(16)
   ) ;
--------------------------------------------------------
--  DDL for Index AK_2_DATA_ACCESS_SCOPE
--------------------------------------------------------

  CREATE UNIQUE INDEX "AK_2_DATA_ACCESS_SCOPE" ON "DATA_ACCESS_SCOPE" ("USER_ID", "HIERARCHY_TYPE", "DATA_ACCESS_LEVEL") 
  ;
--------------------------------------------------------
--  DDL for Index PK_DATA_ACCESS_SCOPE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_DATA_ACCESS_SCOPE" ON "DATA_ACCESS_SCOPE" ("DATA_ACCESS_SCOPE_UUID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_DATA_ACCESS_SCOPE_UNIT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_DATA_ACCESS_SCOPE_UNIT" ON "DATA_ACCESS_SCOPE_UNIT" ("DATA_ACCESS_SCOPE_UNIT_UUID") 
  ;
--------------------------------------------------------
--  DDL for Index AK_2_DATA_SCOPE_UNIT
--------------------------------------------------------

  CREATE UNIQUE INDEX "AK_2_DATA_SCOPE_UNIT" ON "DATA_ACCESS_SCOPE_UNIT" ("DATA_ACCESS_SCOPE_UUID", "DATA_ACCESS_UNIT_UUID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_DATA_ACCESS_USER
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_DATA_ACCESS_USER" ON "DATA_ACCESS_USER" ("USER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_GROUP_UNIT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_GROUP_UNIT" ON "GROUP_UNIT" ("GROUP_UNIT_UUID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_FRM_ACTION
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_FRM_ACTION" ON "FRM_ACTION" ("FRM_ACTION_UUID") 
  ;
--------------------------------------------------------
--  DDL for Index AK_KEY_FRM_ACTION_ID_FRM_ACTI
--------------------------------------------------------

  CREATE UNIQUE INDEX "AK_KEY_FRM_ACTION_ID_FRM_ACTI" ON "FRM_ACTION" ("FRM_ACTION_GROUP_UUID", "FRM_ACTION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_FRM_ACTION_GROUP
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_FRM_ACTION_GROUP" ON "FRM_ACTION_GROUP" ("FRM_ACTION_GROUP_UUID") 
  ;
--------------------------------------------------------
--  DDL for Index AK_KEY_FRM_ACTION_GRO_FRM_ACTI
--------------------------------------------------------

  CREATE UNIQUE INDEX "AK_KEY_FRM_ACTION_GRO_FRM_ACTI" ON "FRM_ACTION_GROUP" ("FRM_ACTION_GROUP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_FRM_FUNCTION
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_FRM_FUNCTION" ON "FRM_FUNCTION" ("FRM_FUNCTION_UUID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_FRM_SUBSYSTEM
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_FRM_SUBSYSTEM" ON "FRM_SUBSYSTEM" ("FRM_SUBSYSTEM_UUID") 
  ;
  CREATE UNIQUE INDEX "FRM_SUBSYSTEM_UK1" ON  "FRM_SUBSYSTEM" ("FRM_SYSTEM_ID","FRM_SUBSYSTEM_ID")
  ;
--------------------------------------------------------
--  DDL for Index AK_KEY_SUBSYSTEMID_FRM_SUBS
--------------------------------------------------------

  CREATE UNIQUE INDEX "AK_KEY_SUBSYSTEMID_FRM_SUBS" ON "FRM_SUBSYSTEM" ("FRM_SUBSYSTEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ROLE_UNIT_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROLE_UNIT_UK1" ON "ROLE_UNIT" ("CODE") 
  ;
--------------------------------------------------------
--  DDL for Index PK_ROLE_UNIT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_ROLE_UNIT" ON "ROLE_UNIT" ("ROLE_UNIT_UUID") 
  ;
--------------------------------------------------------
--  Constraints for Table DATA_ACCESS_SCOPE
--------------------------------------------------------

  ALTER TABLE "DATA_ACCESS_SCOPE" ADD CONSTRAINT "AK_2_DATA_ACCESS_SCOPE" UNIQUE ("USER_ID", "HIERARCHY_TYPE", "DATA_ACCESS_LEVEL") ENABLE;
 
  ALTER TABLE "DATA_ACCESS_SCOPE" ADD CONSTRAINT "PK_DATA_ACCESS_SCOPE" PRIMARY KEY ("DATA_ACCESS_SCOPE_UUID") ENABLE;
 
  ALTER TABLE "DATA_ACCESS_SCOPE" MODIFY ("DATA_ACCESS_SCOPE_UUID" NOT NULL ENABLE);
 
  ALTER TABLE "DATA_ACCESS_SCOPE" MODIFY ("HIERARCHY_TYPE" NOT NULL ENABLE);
 
  ALTER TABLE "DATA_ACCESS_SCOPE" MODIFY ("REC_UPD_DT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DATA_ACCESS_SCOPE_UNIT
--------------------------------------------------------

  ALTER TABLE "DATA_ACCESS_SCOPE_UNIT" ADD CONSTRAINT "AK_2_DATA_SCOPE_UNIT" UNIQUE ("DATA_ACCESS_SCOPE_UUID", "DATA_ACCESS_UNIT_UUID") ENABLE;
 
  ALTER TABLE "DATA_ACCESS_SCOPE_UNIT" ADD CONSTRAINT "PK_DATA_ACCESS_SCOPE_UNIT" PRIMARY KEY ("DATA_ACCESS_SCOPE_UNIT_UUID") ENABLE;
 
  ALTER TABLE "DATA_ACCESS_SCOPE_UNIT" MODIFY ("DATA_ACCESS_SCOPE_UNIT_UUID" NOT NULL ENABLE);
 
  ALTER TABLE "DATA_ACCESS_SCOPE_UNIT" MODIFY ("REC_UPD_DT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DATA_ACCESS_USER
--------------------------------------------------------

  ALTER TABLE "DATA_ACCESS_USER" ADD CONSTRAINT "PK_DATA_ACCESS_USER" PRIMARY KEY ("USER_ID") ENABLE;
 
  ALTER TABLE "DATA_ACCESS_USER" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "DATA_ACCESS_USER" MODIFY ("REC_UPD_DTE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table GROUP_UNIT
--------------------------------------------------------

  ALTER TABLE "GROUP_UNIT" ADD CONSTRAINT "PK_GROUP_UNIT" PRIMARY KEY ("GROUP_UNIT_UUID") ENABLE;
 
  ALTER TABLE "GROUP_UNIT" MODIFY ("GROUP_UNIT_UUID" NOT NULL ENABLE);
 
  ALTER TABLE "GROUP_UNIT" MODIFY ("REC_UPD_DT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FRM_ACTION
--------------------------------------------------------

  ALTER TABLE "FRM_ACTION" ADD CONSTRAINT "AK_KEY_FRM_ACTION_ID_FRM_ACTI" UNIQUE ("FRM_ACTION_GROUP_UUID", "FRM_ACTION_ID") ENABLE;
 
  ALTER TABLE "FRM_ACTION" ADD CONSTRAINT "PK_FRM_ACTION" PRIMARY KEY ("FRM_ACTION_UUID") ENABLE;
 
  ALTER TABLE "FRM_ACTION" MODIFY ("FRM_ACTION_UUID" NOT NULL ENABLE);
 
  ALTER TABLE "FRM_ACTION" MODIFY ("FRM_ACTION_ID" NOT NULL ENABLE);
 
  ALTER TABLE "FRM_ACTION" MODIFY ("IS_PUBLIC" NOT NULL ENABLE);
 
  ALTER TABLE "FRM_ACTION" MODIFY ("REC_UPD_DT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FRM_ACTION_GROUP
--------------------------------------------------------

  ALTER TABLE "FRM_ACTION_GROUP" ADD CONSTRAINT "AK_KEY_FRM_ACTION_GRO_FRM_ACTI" UNIQUE ("FRM_ACTION_GROUP_ID") ENABLE;
 
  ALTER TABLE "FRM_ACTION_GROUP" ADD CONSTRAINT "PK_FRM_ACTION_GROUP" PRIMARY KEY ("FRM_ACTION_GROUP_UUID") ENABLE;
 
  ALTER TABLE "FRM_ACTION_GROUP" MODIFY ("FRM_ACTION_GROUP_UUID" NOT NULL ENABLE);
 
  ALTER TABLE "FRM_ACTION_GROUP" MODIFY ("FRM_ACTION_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "FRM_ACTION_GROUP" MODIFY ("REC_UPD_DT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FRM_FUNCTION
--------------------------------------------------------

  ALTER TABLE "FRM_FUNCTION" ADD CONSTRAINT "PK_FRM_FUNCTION" PRIMARY KEY ("FRM_FUNCTION_UUID") ENABLE;
 
  ALTER TABLE "FRM_FUNCTION" MODIFY ("FRM_FUNCTION_UUID" NOT NULL ENABLE);
 
  ALTER TABLE "FRM_FUNCTION" MODIFY ("FRM_FUNCTION_ID" NOT NULL ENABLE);
 
  ALTER TABLE "FRM_FUNCTION" MODIFY ("FRM_SUBSYSTEM_UUID" NOT NULL ENABLE);
 
  ALTER TABLE "FRM_FUNCTION" MODIFY ("REC_UPD_DT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FRM_SUBSYSTEM
--------------------------------------------------------

  ALTER TABLE "FRM_SUBSYSTEM" ADD CONSTRAINT "AK_KEY_SUBSYSTEMID_FRM_SUBS" UNIQUE ("FRM_SUBSYSTEM_ID") ENABLE;
 
  ALTER TABLE "FRM_SUBSYSTEM" ADD CONSTRAINT "PK_FRM_SUBSYSTEM" PRIMARY KEY ("FRM_SUBSYSTEM_UUID") ENABLE;
 
  ALTER TABLE "FRM_SUBSYSTEM" MODIFY ("FRM_SUBSYSTEM_UUID" NOT NULL ENABLE);
 
  ALTER TABLE "FRM_SUBSYSTEM" MODIFY ("FRM_SUBSYSTEM_ID" NOT NULL ENABLE);
 
  ALTER TABLE "FRM_SUBSYSTEM" MODIFY ("REC_UPD_DT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ROLE_UNIT
--------------------------------------------------------

  ALTER TABLE "ROLE_UNIT" ADD CONSTRAINT "PK_ROLE_UNIT" PRIMARY KEY ("ROLE_UNIT_UUID") ENABLE;
 
  ALTER TABLE "ROLE_UNIT" ADD CONSTRAINT "ROLE_UNIT_UK1" UNIQUE ("CODE") ENABLE;
 
  ALTER TABLE "ROLE_UNIT" MODIFY ("ROLE_UNIT_UUID" NOT NULL ENABLE);
 
  ALTER TABLE "ROLE_UNIT" MODIFY ("REC_UPD_DT" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table DATA_ACCESS_SCOPE
--------------------------------------------------------

  ALTER TABLE "DATA_ACCESS_SCOPE" ADD CONSTRAINT "FK_DATA_ACC_REFERENCE_USER" FOREIGN KEY ("USER_ID")
	  REFERENCES "DATA_ACCESS_USER" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DATA_ACCESS_SCOPE_UNIT
--------------------------------------------------------

  ALTER TABLE "DATA_ACCESS_SCOPE_UNIT" ADD CONSTRAINT "FK_DATA_ACC_REF_SCOPE" FOREIGN KEY ("DATA_ACCESS_SCOPE_UUID")
	  REFERENCES "DATA_ACCESS_SCOPE" ("DATA_ACCESS_SCOPE_UUID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FRM_ACTION
--------------------------------------------------------

  ALTER TABLE "FRM_ACTION" ADD CONSTRAINT "FK_FRM_ACTI_REFERENCE_FRM_ACTI" FOREIGN KEY ("FRM_ACTION_GROUP_UUID")
	  REFERENCES "FRM_ACTION_GROUP" ("FRM_ACTION_GROUP_UUID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FRM_FUNCTION
--------------------------------------------------------

  ALTER TABLE "FRM_FUNCTION" ADD CONSTRAINT "FK_FRM_FUNC_REFERENCE_FRM_ACTI" FOREIGN KEY ("FRM_ACTION_GROUP_UUID")
	  REFERENCES "FRM_ACTION_GROUP" ("FRM_ACTION_GROUP_UUID") ENABLE;
 
  ALTER TABLE "FRM_FUNCTION" ADD CONSTRAINT "FK_FRM_FUNC_REFERENCE_FRM_SUBS" FOREIGN KEY ("FRM_SUBSYSTEM_UUID")
	  REFERENCES "FRM_SUBSYSTEM" ("FRM_SUBSYSTEM_UUID") ENABLE;



  CREATE OR REPLACE FORCE VIEW "V_FRM_SYSTEM_ID" AS 
  SELECT DISTINCT S.FRM_SYSTEM_ID, S.FRM_SUBSYSTEM_ID , F.FRM_FUNCTION_ID, AG.FRM_ACTION_GROUP_ID,AC.FRM_ACTION_ID
            FROM
                FRM_SUBSYSTEM S   LEFT OUTER JOIN  FRM_FUNCTION  F ON S.FRM_SUBSYSTEM_UUID=F.FRM_SUBSYSTEM_UUID
                LEFT OUTER JOIN  FRM_ACTION_GROUP AG   ON F.FRM_ACTION_GROUP_UUID=AG.FRM_ACTION_GROUP_UUID  
                LEFT OUTER JOIN  FRM_ACTION AC  ON AG.FRM_ACTION_GROUP_UUID=AC.FRM_ACTION_GROUP_UUID  AND AC.IS_PUBLIC =0;





insert into ROLE_UNIT
		 (ROLE_UNIT_UUID,CODE,NAME,REC_UPD_DT,REC_UPD_USER_ID)
		 select sys_guid(),ROLEUNIT_CODE,ROLEUNIT_NAME, sysdate, 'system'
		 FROM
		 (SELECT distinct FRM_SYSTEM_ID as ROLEUNIT_CODE,FRM_SYSTEM_ID as ROLEUNIT_NAME  FROM  V_FRM_SYSTEM_ID
		 UNION 
		 SELECT distinct FRM_SYSTEM_ID || '/' || FRM_SUBSYSTEM_ID as ROLEUNIT_CODE, FRM_SUBSYSTEM_ID as ROLEUNIT_NAME  FROM  V_FRM_SYSTEM_ID where FRM_SUBSYSTEM_ID is not null
		 UNION 
		 SELECT distinct FRM_SYSTEM_ID || '/' || FRM_SUBSYSTEM_ID  || '/'  || FRM_FUNCTION_ID as ROLEUNIT_CODE, FRM_FUNCTION_ID as ROLEUNIT_NAME  FROM  V_FRM_SYSTEM_ID where FRM_FUNCTION_ID is not null
		 UNION 
		 SELECT distinct FRM_SYSTEM_ID || '/' || FRM_SUBSYSTEM_ID || '/'  || FRM_FUNCTION_ID || '/' || FRM_ACTION_ID as ROLEUNIT_CODE,FRM_ACTION_ID as ROLEUNIT_NAME  FROM V_FRM_SYSTEM_ID where FRM_ACTION_ID is not null
		 ) BT
		 WHERE
		 NOT EXISTS (SELECT  1  FROM ROLE_UNIT RU WHERE BT.ROLEUNIT_CODE=RU.CODE);


Insert Into Data_Access_User (User_Id,Rec_Upd_Dte,Rec_Upd_User_Id) values ('system',sysdate,'system');
commit;



drop index IDX_FAX_STATUS;

drop index IDX_FAX_RECEIVER;

drop index IDX_FAX_SENDER;

drop table FRM_FAX_LOG cascade constraints;

/*==============================================================*/
/* Table: FRM_FAX_LOG                                           */
/*==============================================================*/
create table FRM_FAX_LOG 
(
   FRM_FAX_LOG_UUID     CHAR(32)             not null,
   SENDER_ID            VARCHAR2(16)         not null,
   RECEIVER_FAX         VARCHAR2(50)         not null,
   FAX_DT               TIMESTAMP            default SYSTIMESTAMP not null,
   STATUS               VARCHAR(50)          not null,
   RETRY_TIMES          INT                  default 0,
   REC_UPD_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   constraint PK_FRM_FAX_LOG primary key (FRM_FAX_LOG_UUID)
);

/*==============================================================*/
/* Index: IDX_FAX_SENDER                                        */
/*==============================================================*/
create index IDX_FAX_SENDER on FRM_FAX_LOG (
   SENDER_ID ASC
);

/*==============================================================*/
/* Index: IDX_FAX_RECEIVER                                      */
/*==============================================================*/
create index IDX_FAX_RECEIVER on FRM_FAX_LOG (
   RECEIVER_FAX ASC
);

/*==============================================================*/
/* Index: IDX_FAX_STATUS                                        */
/*==============================================================*/
create index IDX_FAX_STATUS on FRM_FAX_LOG (
   STATUS ASC
);


drop index IDX_ARC_SRC;

drop index IDX_ARC_TO;

drop index IDX_ARC_FROM;

drop index IDX_ARC_FILE;

drop index IDX_ARC_TYPE;

drop table FRM_ARCHIVE cascade constraints;

/*==============================================================*/
/* Table: FRM_ARCHIVE                                           */
/*==============================================================*/
create table FRM_ARCHIVE 
(
   FRM_ARCHIVE_UUID     CHAR(32)             not null,
   ARCHIVE_TYPE         VARCHAR2(50)         not null,
   ARCHIVED_FILENAME    NVARCHAR2(2000)      not null,
   SRC_FILENAME         CLOB                 not null,
   SRC_FROM_DT          TIMESTAMP            default SYSTIMESTAMP not null,
   SRC_TO_DT            TIMESTAMP            default SYSTIMESTAMP not null,
   REC_UPD_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   REC_UPD_USER_ID      VARCHAR2(16)         not null,
   constraint PK_FRM_ARCHIVE primary key (FRM_ARCHIVE_UUID)
);

/*==============================================================*/
/* Index: IDX_ARC_TYPE                                          */
/*==============================================================*/
create index IDX_ARC_TYPE on FRM_ARCHIVE (
   ARCHIVE_TYPE ASC
);

/*==============================================================*/
/* Index: IDX_ARC_FILE                                          */
/*==============================================================*/
create unique index IDX_ARC_FILE on FRM_ARCHIVE (
   ARCHIVED_FILENAME ASC
);

/*==============================================================*/
/* Index: IDX_ARC_FROM                                          */
/*==============================================================*/
create index IDX_ARC_FROM on FRM_ARCHIVE (
   SRC_FROM_DT ASC
);

/*==============================================================*/
/* Index: IDX_ARC_TO                                            */
/*==============================================================*/
create index IDX_ARC_TO on FRM_ARCHIVE (
   SRC_TO_DT ASC
);

/*==============================================================*/
/* Index: IDX_ARC_SRC                                           */
/*==============================================================*/
create index IDX_ARC_SRC on FRM_ARCHIVE (
   SRC_FILENAME
)
indextype is CTXSYS.CONTEXT;
