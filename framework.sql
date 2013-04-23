/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     2012/11/18 10:12:03                          */
/*==============================================================*/


alter table DATA_ACCESS_SCOPE
   drop constraint FK_DATA_ACC_REFERENCE_USER;

alter table DATA_ACCESS_SCOPE_UNIT
   drop constraint FK_DATA_ACC_REF_SCOPE;

alter table FRM_ACTION
   drop constraint FK_FRM_ACTI_REFERENCE_FRM_ACTI;

alter table FRM_FUNCTION
   drop constraint FK_FRM_FUNC_REFERENCE_FRM_ACTI;

alter table FRM_FUNCTION
   drop constraint FK_FRM_FUNC_REFERENCE_FRM_SUBS;

alter table FRM_FUNCTION_MENU
   drop constraint FK_FRM_FUNC_MENU_PARENT;

alter table GLOBAL_SERVICE_NAMESPACE
   drop constraint FK_GLOBAL_S_REFERENCE_GLOBAL_C;

drop view V_FRM_SYSTEM_ID;

drop view V_GLOBAL_CARRIERS;

drop view V_GLOBAL_SERVICE_NAMESPACE;

drop index IDX_DATA_ACC_SCOPE_HIERA;

drop index IDX_DATA_ACC_SCOPE_USER;

drop table DATA_ACCESS_SCOPE cascade constraints;

drop index IDX_DATA_ACC_SCO_UNIT_UNIT;

drop index IDX_DATAACCSCO_UUID;

drop table DATA_ACCESS_SCOPE_UNIT cascade constraints;

drop table DATA_ACCESS_USER cascade constraints;

drop index IDX_FRM_ACTION_GROUPID;

drop table FRM_ACTION cascade constraints;

drop table FRM_ACTION_GROUP cascade constraints;

drop index IDX_ARC_SRC;

drop index IDX_ARC_TO;

drop index IDX_ARC_FROM;

drop index IDX_ARC_FILE;

drop index IDX_ARC_TYPE;

drop table FRM_ARCHIVE cascade constraints;

drop index IDX_FRM_DT_VER_RECDT;

drop index IDX_FRM_DT_VER_USERID;

drop index IDX_FRM_DT_VER_DATAUUIDVER;

drop table FRM_DATA_VER cascade constraints;

drop index IDX_FAX_STATUS;

drop index IDX_FAX_RECEIVER;

drop index IDX_FAX_SENDER;

drop table FRM_FAX cascade constraints;

drop index IDX_FRM_FUNC_SUBSYSTEM;

drop index IDX_FRM_FUNC_ACTIONGROUP;

drop table FRM_FUNCTION cascade constraints;

drop index IDX_FRM_FUNC_PARENT;

drop index IDX_FRM_FUNC_OWNER_ID;

drop index IDX_FRM_FUNC_MENU_ID;

drop table FRM_FUNCTION_MENU cascade constraints;

drop index IDX_LOGIN_HIS_LOGOUTDT;

drop index IDX_LOGIN_HIS_LOGINDT;

drop index IDX_LOGIN_HIS_USERID;

drop table FRM_LOGIN_HISTORY cascade constraints;

drop index IDX_MAIL_UPD_DT;

drop index IDX_MAIL_STATUS;

drop index IDX_MAIL_TO;

drop index IDX_MAIL_SENDER;

drop index IDX_MAIL_SUBJECT;

drop table FRM_MAIL cascade constraints;

drop index FRM_SUBSYSTEM_UK1;

drop table FRM_SUBSYSTEM cascade constraints;

drop index IDX_FRM_SVC_EVT_STATUS;

drop index IDX_FRM_SVC_EVT_DT;

drop index IDX_FRM_SVC_EVT_USER;

drop index IDX_FRM_SVC_EVT_NAME;

drop table FRM_SVC_EVENT cascade constraints;

drop index IDX_SVC_MON_EVT_DATE;

drop index IDX_SVC_MON_EVT_TIME;

drop index IDX_SVC_MON_EVT_TASK;

drop index IDX_SVC_MON_EVT_USERID;

drop table FRM_SVC_MONITOR_EVENT cascade constraints;

drop table GLOBAL_CARRIERS cascade constraints;

drop index IDX_GLOBAL_SVC_NMSPACE_CAR;

drop table GLOBAL_SERVICE_NAMESPACE cascade constraints;

drop table GROUP_UNIT cascade constraints;

drop index UK_POOLED_KEY;

drop table POOLED_KEY cascade constraints;

drop table ROLE_UNIT cascade constraints;

drop user SYSTEM;

/*==============================================================*/
/* User: SYSTEM                                                 */
/*==============================================================*/
create user SYSTEM 
  identified by "";

/*==============================================================*/
/* Table: DATA_ACCESS_SCOPE                                     */
/*==============================================================*/
create table DATA_ACCESS_SCOPE 
(
   DATA_ACCESS_SCOPE_UUID CHAR(32)             not null,
   HIERARCHY_TYPE       VARCHAR2(20),
   DATA_ACCESS_LEVEL    VARCHAR2(20),
   GSP_OFCE_CDE         CHAR(3),
   USER_ID              VARCHAR2(16),
   REC_UPD_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   REC_UPD_USER_ID      VARCHAR2(16)         not null,
   constraint PK_DATA_ACCESS_SCOPE primary key (DATA_ACCESS_SCOPE_UUID)
         ENABLE,
   constraint AK_2_DATA_ACCESS_SCOPE unique (USER_ID, HIERARCHY_TYPE, DATA_ACCESS_LEVEL)
         ENABLE
);

/*==============================================================*/
/* Index: IDX_DATA_ACC_SCOPE_USER                               */
/*==============================================================*/
create index IDX_DATA_ACC_SCOPE_USER on DATA_ACCESS_SCOPE (
   USER_ID ASC
);

/*==============================================================*/
/* Index: IDX_DATA_ACC_SCOPE_HIERA                              */
/*==============================================================*/
create index IDX_DATA_ACC_SCOPE_HIERA on DATA_ACCESS_SCOPE (
   HIERARCHY_TYPE ASC
);

/*==============================================================*/
/* Table: DATA_ACCESS_SCOPE_UNIT                                */
/*==============================================================*/
create table DATA_ACCESS_SCOPE_UNIT 
(
   DATA_ACCESS_SCOPE_UNIT_UUID CHAR(32)             not null,
   DATA_ACCESS_SCOPE_UUID CHAR(32),
   DATA_ACCESS_UNIT_UUID CHAR(32),
   REC_UPD_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   REC_UPD_USER_ID      VARCHAR2(16),
   constraint PK_DATA_ACCESS_SCOPE_UNIT primary key (DATA_ACCESS_SCOPE_UNIT_UUID)
         ENABLE,
   constraint AK_2_DATA_SCOPE_UNIT unique (DATA_ACCESS_SCOPE_UUID, DATA_ACCESS_UNIT_UUID)
         ENABLE
);

/*==============================================================*/
/* Index: IDX_DATAACCSCO_UUID                                   */
/*==============================================================*/
create index IDX_DATAACCSCO_UUID on DATA_ACCESS_SCOPE_UNIT (
   DATA_ACCESS_SCOPE_UUID ASC
);

/*==============================================================*/
/* Index: IDX_DATA_ACC_SCO_UNIT_UNIT                            */
/*==============================================================*/
create index IDX_DATA_ACC_SCO_UNIT_UNIT on DATA_ACCESS_SCOPE_UNIT (
   DATA_ACCESS_UNIT_UUID ASC
);

/*==============================================================*/
/* Table: DATA_ACCESS_USER                                      */
/*==============================================================*/
create table DATA_ACCESS_USER 
(
   USER_ID              VARCHAR2(16)         not null,
   ROLE_CODES           CLOB,
   GROUP_CODES          CLOB,
   REC_UPD_DTE          TIMESTAMP            default SYSTIMESTAMP not null,
   REC_UPD_USER_ID      VARCHAR2(16),
   constraint PK_DATA_ACCESS_USER primary key (USER_ID)
         ENABLE
);

/*==============================================================*/
/* Table: FRM_ACTION                                            */
/*==============================================================*/
create table FRM_ACTION 
(
   FRM_ACTION_UUID      CHAR(32)             not null,
   FRM_ACTION_GROUP_UUID CHAR(32),
   FRM_ACTION_ID        VARCHAR2(200),
   IS_PUBLIC            NUMBER(1,0)          default 0,
   REC_UPD_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   REC_UPD_USER_ID      VARCHAR2(16),
   constraint PK_FRM_ACTION primary key (FRM_ACTION_UUID)
         ENABLE,
   constraint AK_KEY_FRM_ACTION_ID_FRM_ACTI unique (FRM_ACTION_GROUP_UUID, FRM_ACTION_ID)
         ENABLE
);

/*==============================================================*/
/* Index: IDX_FRM_ACTION_GROUPID                                */
/*==============================================================*/
create index IDX_FRM_ACTION_GROUPID on FRM_ACTION (
   FRM_ACTION_GROUP_UUID ASC
);

/*==============================================================*/
/* Table: FRM_ACTION_GROUP                                      */
/*==============================================================*/
create table FRM_ACTION_GROUP 
(
   FRM_ACTION_GROUP_UUID CHAR(32)             not null,
   FRM_ACTION_GROUP_ID  VARCHAR2(200),
   REC_UPD_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   REC_UPD_USER_ID      VARCHAR2(16),
   constraint PK_FRM_ACTION_GROUP primary key (FRM_ACTION_GROUP_UUID)
         ENABLE,
   constraint AK_KEY_FRM_ACTION_GRO_FRM_ACTI unique (FRM_ACTION_GROUP_ID)
         ENABLE
);

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

/*==============================================================*/
/* Table: FRM_DATA_VER                                          */
/*==============================================================*/
create table FRM_DATA_VER 
(
   FRM_DATA_VER_UUID    CHAR(32)             not null,
   DATA_UUID            CHAR(32)             not null,
   DATA_XML             CLOB                 not null,
   DATA_VER             NUMERIC(22,0)        not null,
   REC_UPD_USER_ID      VARCHAR2(16)         not null,
   REC_UPD_DTE          TIMESTAMP            default SYSTIMESTAMP not null,
   constraint PK_FRM_DATA_VER primary key (FRM_DATA_VER_UUID)
);

/*==============================================================*/
/* Index: IDX_FRM_DT_VER_DATAUUIDVER                            */
/*==============================================================*/
create unique index IDX_FRM_DT_VER_DATAUUIDVER on FRM_DATA_VER (
   DATA_UUID ASC,
   DATA_VER ASC
);

/*==============================================================*/
/* Index: IDX_FRM_DT_VER_USERID                                 */
/*==============================================================*/
create index IDX_FRM_DT_VER_USERID on FRM_DATA_VER (
   REC_UPD_USER_ID ASC
);

/*==============================================================*/
/* Index: IDX_FRM_DT_VER_RECDT                                  */
/*==============================================================*/
create index IDX_FRM_DT_VER_RECDT on FRM_DATA_VER (
   REC_UPD_DTE ASC
);

/*==============================================================*/
/* Table: FRM_FAX                                               */
/*==============================================================*/
create table FRM_FAX 
(
   FRM_FAX_UUID         CHAR(32)             not null,
   SENDER_ID            VARCHAR2(16)         not null,
   RECEIVER_FAX         VARCHAR2(50)         not null,
   RECEIVER_INFO        NVARCHAR2(2000),
   ATTACHMENT_ZIPFILE   BLOB,
   STATUS               VARCHAR(50)          not null,
   RETRY_TIMES          INT                  default 0,
   REC_CRT_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   REC_UPD_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   REC_UPD_USER_ID      VARCHAR2(16),
   constraint PK_FRM_FAX primary key (FRM_FAX_UUID)
)
lob
 (ATTACHMENT_ZIPFILE)
    store as (tablespace ORCLLOBS);

/*==============================================================*/
/* Index: IDX_FAX_SENDER                                        */
/*==============================================================*/
create index IDX_FAX_SENDER on FRM_FAX (
   SENDER_ID ASC
);

/*==============================================================*/
/* Index: IDX_FAX_RECEIVER                                      */
/*==============================================================*/
create index IDX_FAX_RECEIVER on FRM_FAX (
   RECEIVER_FAX ASC
);

/*==============================================================*/
/* Index: IDX_FAX_STATUS                                        */
/*==============================================================*/
create index IDX_FAX_STATUS on FRM_FAX (
   STATUS ASC
);

/*==============================================================*/
/* Table: FRM_FUNCTION                                          */
/*==============================================================*/
create table FRM_FUNCTION 
(
   FRM_FUNCTION_UUID    CHAR(32)             not null,
   FRM_FUNCTION_ID      VARCHAR2(200),
   FRM_SUBSYSTEM_UUID   CHAR(32),
   FRM_ACTION_GROUP_UUID CHAR(32),
   FRM_FUNCTION_PARAM   VARCHAR2(200),
   REC_UPD_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   REC_UPD_USER_ID      VARCHAR2(16),
   constraint PK_FRM_FUNCTION primary key (FRM_FUNCTION_UUID)
         ENABLE
);

/*==============================================================*/
/* Index: IDX_FRM_FUNC_ACTIONGROUP                              */
/*==============================================================*/
create index IDX_FRM_FUNC_ACTIONGROUP on FRM_FUNCTION (
   FRM_ACTION_GROUP_UUID ASC
);

/*==============================================================*/
/* Index: IDX_FRM_FUNC_SUBSYSTEM                                */
/*==============================================================*/
create index IDX_FRM_FUNC_SUBSYSTEM on FRM_FUNCTION (
   FRM_SUBSYSTEM_UUID ASC
);

/*==============================================================*/
/* Table: FRM_FUNCTION_MENU                                     */
/*==============================================================*/
create table FRM_FUNCTION_MENU 
(
   FRM_FUNCTION_MENU_UUID CHAR(32)             not null,
   MENU_ID              VARCHAR2(100)        not null,
   PARENT_FRM_FUNCTION_MENU_UUID CHAR(32),
   OWNER_USER_ID        VARCHAR2(16),
   SORT_INDEX           NUMERIC(3),
   ACTION               VARCHAR2(200),
   IS_VALID             CHAR(1),
   PARAM                VARCHAR2(200),
   IS_CONFIRM           CHAR(1),
   IMG_SRC              VARCHAR2(200),
   REC_UPD_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   REC_UPD_USER_ID      VARCHAR2(16)         not null,
   constraint PK_FRM_FUNCTION_MENU primary key (FRM_FUNCTION_MENU_UUID),
   constraint AK_FRM_FUNC_MENU_ID unique (MENU_ID, OWNER_USER_ID)
);

/*==============================================================*/
/* Index: IDX_FRM_FUNC_MENU_ID                                  */
/*==============================================================*/
create index IDX_FRM_FUNC_MENU_ID on FRM_FUNCTION_MENU (
   MENU_ID ASC
);

/*==============================================================*/
/* Index: IDX_FRM_FUNC_OWNER_ID                                 */
/*==============================================================*/
create index IDX_FRM_FUNC_OWNER_ID on FRM_FUNCTION_MENU (
   OWNER_USER_ID ASC
);

/*==============================================================*/
/* Index: IDX_FRM_FUNC_PARENT                                   */
/*==============================================================*/
create index IDX_FRM_FUNC_PARENT on FRM_FUNCTION_MENU (
   PARENT_FRM_FUNCTION_MENU_UUID ASC
);

/*==============================================================*/
/* Table: FRM_LOGIN_HISTORY                                     */
/*==============================================================*/
create table FRM_LOGIN_HISTORY 
(
   FRM_LOGIN_HISTORY_UUID CHAR(32)             not null,
   USER_ID              VARCHAR2(16)         not null,
   LOGIN_DT             TIMESTAMP            default SYSTIMESTAMP not null,
   LOGOUT_DT            TIMESTAMP,
   CLIENT_VERSION       varchar2(20),
   SERVER_VERSION       varchar2(20),
   REC_UPD_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   constraint PK_FRM_LOGIN_HISTORY primary key (FRM_LOGIN_HISTORY_UUID)
);

/*==============================================================*/
/* Index: IDX_LOGIN_HIS_USERID                                  */
/*==============================================================*/
create index IDX_LOGIN_HIS_USERID on FRM_LOGIN_HISTORY (
   USER_ID ASC,
   CLIENT_VERSION ASC,
   SERVER_VERSION ASC
);

/*==============================================================*/
/* Index: IDX_LOGIN_HIS_LOGINDT                                 */
/*==============================================================*/
create index IDX_LOGIN_HIS_LOGINDT on FRM_LOGIN_HISTORY (
   LOGIN_DT ASC
);

/*==============================================================*/
/* Index: IDX_LOGIN_HIS_LOGOUTDT                                */
/*==============================================================*/
create index IDX_LOGIN_HIS_LOGOUTDT on FRM_LOGIN_HISTORY (
   LOGOUT_DT ASC
);

/*==============================================================*/
/* Table: FRM_MAIL                                              */
/*==============================================================*/
create table FRM_MAIL 
(
   FRM_MAIL_UUID        CHAR(32)             not null,
   SUBJECT              NVARCHAR2(200),
   SENDER               varchar2(100)        not null,
   RECIPIENT_TO         varchar2(2000),
   RECIPIENT_CC         varchar2(2000),
   RECIPIENT_BCC        varchar2(2000),
   MAIL_CONTENT         clob,
   ATTACHMENT_ZIPFILE   BLOB,
   STATUS               varchar2(20)         not null,
   RETRY_TIMES          INT                  default 0,
   REC_CRT_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   REC_UPD_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   REC_UPD_USER_ID      VARCHAR2(16)         not null,
   constraint PK_FRM_MAIL primary key (FRM_MAIL_UUID)
)
lob
 (MAIL_CONTENT,ATTACHMENT_ZIPFILE)
    store as (tablespace ORCLLOBS);

/*==============================================================*/
/* Index: IDX_MAIL_SUBJECT                                      */
/*==============================================================*/
create index IDX_MAIL_SUBJECT on FRM_MAIL (
   SUBJECT ASC
);

/*==============================================================*/
/* Index: IDX_MAIL_SENDER                                       */
/*==============================================================*/
create index IDX_MAIL_SENDER on FRM_MAIL (
   SENDER ASC
);

/*==============================================================*/
/* Index: IDX_MAIL_TO                                           */
/*==============================================================*/
create index IDX_MAIL_TO on FRM_MAIL (
   RECIPIENT_TO ASC
);

/*==============================================================*/
/* Index: IDX_MAIL_STATUS                                       */
/*==============================================================*/
create index IDX_MAIL_STATUS on FRM_MAIL (
   STATUS ASC
);

/*==============================================================*/
/* Index: IDX_MAIL_UPD_DT                                       */
/*==============================================================*/
create index IDX_MAIL_UPD_DT on FRM_MAIL (
   REC_UPD_DT ASC
);

/*==============================================================*/
/* Table: FRM_SUBSYSTEM                                         */
/*==============================================================*/
create table FRM_SUBSYSTEM 
(
   FRM_SUBSYSTEM_UUID   CHAR(32)             not null,
   FRM_SUBSYSTEM_ID     VARCHAR2(200),
   FRM_SYSTEM_ID        VARCHAR2(200)        not null,
   REC_UPD_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   REC_UPD_USER_ID      VARCHAR2(16),
   constraint PK_FRM_SUBSYSTEM primary key (FRM_SUBSYSTEM_UUID)
         ENABLE,
   constraint AK_KEY_SUBSYSTEMID_FRM_SUBS unique (FRM_SUBSYSTEM_ID)
         ENABLE
);

/*==============================================================*/
/* Index: FRM_SUBSYSTEM_UK1                                     */
/*==============================================================*/
create unique index FRM_SUBSYSTEM_UK1 on FRM_SUBSYSTEM (
   FRM_SYSTEM_ID ASC,
   FRM_SUBSYSTEM_ID ASC
);

/*==============================================================*/
/* Table: FRM_SVC_EVENT                                         */
/*==============================================================*/
create table FRM_SVC_EVENT 
(
   FRM_SVC_EVENT_UUID   CHAR(32)             not null,
   EVENT_NAME           varchar2(50)         not null,
   EVENT_USER_ID        VARCHAR2(16),
   EVENT_DATA_XML       CLOB                 not null,
   EVENT_STATUS         varchar2(20)         not null,
   REC_UPD_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   constraint PK_FRM_SVC_EVENT primary key (FRM_SVC_EVENT_UUID)
);

/*==============================================================*/
/* Index: IDX_FRM_SVC_EVT_NAME                                  */
/*==============================================================*/
create index IDX_FRM_SVC_EVT_NAME on FRM_SVC_EVENT (
   EVENT_NAME ASC
);

/*==============================================================*/
/* Index: IDX_FRM_SVC_EVT_USER                                  */
/*==============================================================*/
create index IDX_FRM_SVC_EVT_USER on FRM_SVC_EVENT (
   EVENT_USER_ID ASC
);

/*==============================================================*/
/* Index: IDX_FRM_SVC_EVT_DT                                    */
/*==============================================================*/
create index IDX_FRM_SVC_EVT_DT on FRM_SVC_EVENT (
   REC_UPD_DT ASC
);

/*==============================================================*/
/* Index: IDX_FRM_SVC_EVT_STATUS                                */
/*==============================================================*/
create index IDX_FRM_SVC_EVT_STATUS on FRM_SVC_EVENT (
   EVENT_STATUS ASC
);

/*==============================================================*/
/* Table: FRM_SVC_MONITOR_EVENT                                 */
/*==============================================================*/
create table FRM_SVC_MONITOR_EVENT 
(
   FRM_SVC_MONITOR_EVENT_UUID CHAR(32)             not null,
   USER_ID              VARCHAR2(16),
   TIME_MILLIS          numeric(9,0)         not null,
   TASK_DATE            TIMESTAMP            default SYSTIMESTAMP not null,
   TASK_NAME            varchar2(4000)       not null,
   TASK_ARGS            CLOB,
   REC_UPD_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   constraint PK_FRM_SVC_MONITOR_EVENT primary key (FRM_SVC_MONITOR_EVENT_UUID)
);

/*==============================================================*/
/* Index: IDX_SVC_MON_EVT_USERID                                */
/*==============================================================*/
create index IDX_SVC_MON_EVT_USERID on FRM_SVC_MONITOR_EVENT (
   USER_ID ASC
);

/*==============================================================*/
/* Index: IDX_SVC_MON_EVT_TASK                                  */
/*==============================================================*/
create index IDX_SVC_MON_EVT_TASK on FRM_SVC_MONITOR_EVENT (
   TASK_NAME ASC
);

/*==============================================================*/
/* Index: IDX_SVC_MON_EVT_TIME                                  */
/*==============================================================*/
create index IDX_SVC_MON_EVT_TIME on FRM_SVC_MONITOR_EVENT (
   TIME_MILLIS ASC
);

/*==============================================================*/
/* Index: IDX_SVC_MON_EVT_DATE                                  */
/*==============================================================*/
create index IDX_SVC_MON_EVT_DATE on FRM_SVC_MONITOR_EVENT (
   TASK_DATE ASC
);

/*==============================================================*/
/* Table: GLOBAL_CARRIERS                                       */
/*==============================================================*/
create table GLOBAL_CARRIERS 
(
   GLOBAL_CARRIERS_UUID CHAR(32)             not null,
   CARRIER_CODE         VARCHAR2(10),
   CARRIER_NAME_KEY     VARCHAR2(50),
   CARRIER_SERVER_URL   VARCHAR2(200),
   BL_PREFIX            VARCHAR2(6),
   SCAC_CDE             VARCHAR2(4),
   REC_UPD_DTE          TIMESTAMP            default SYSTIMESTAMP not null,
   constraint PK_GLOBAL_CARRIERS primary key (GLOBAL_CARRIERS_UUID),
   constraint AK_KEY_NAME_GLOBAL_CARRIERS unique (CARRIER_NAME_KEY)
);

/*==============================================================*/
/* Table: GLOBAL_SERVICE_NAMESPACE                              */
/*==============================================================*/
create table GLOBAL_SERVICE_NAMESPACE 
(
   GLOBAL_SERVICE_NAMESPACE_UUID CHAR(32)             not null,
   GLOBAL_CARRIERS_UUID CHAR(32)             not null,
   SERVICE_NAMESPACE    VARCHAR2(20)         not null,
   SERVICE_URL          VARCHAR2(200)        not null,
   REC_UPD_DTE          TIMESTAMP            default SYSTIMESTAMP not null,
   constraint PK_GLOBAL_SERVICE_NAMESPACE primary key (GLOBAL_SERVICE_NAMESPACE_UUID),
   constraint AK_KEY_NAME_GLOBAL_SERVICE unique (GLOBAL_CARRIERS_UUID, SERVICE_NAMESPACE)
);

/*==============================================================*/
/* Index: IDX_GLOBAL_SVC_NMSPACE_CAR                            */
/*==============================================================*/
create index IDX_GLOBAL_SVC_NMSPACE_CAR on GLOBAL_SERVICE_NAMESPACE (
   GLOBAL_CARRIERS_UUID ASC
);

/*==============================================================*/
/* Table: GROUP_UNIT                                            */
/*==============================================================*/
create table GROUP_UNIT 
(
   GROUP_UNIT_UUID      CHAR(32)             not null,
   CODE                 VARCHAR2(100),
   NAME                 VARCHAR2(200),
   ROLE_CODES           CLOB,
   SUB_GROUP_CODES      CLOB,
   REC_UPD_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   REC_UPD_USER_ID      VARCHAR2(16),
   constraint PK_GROUP_UNIT primary key (GROUP_UNIT_UUID)
         ENABLE
);

/*==============================================================*/
/* Table: POOLED_KEY                                            */
/*==============================================================*/
create table POOLED_KEY 
(
   POOLED_KEY_UUID      CHAR(32)             not null,
   KEY_NAME             VARCHAR2(50 BYTE),
   KEY_VALUE            NUMBER(22,0)         default 0,
   KEY_INTERVAL         NUMBER(9,0)          default 1,
   KEY_POOL_SIZE        NUMBER(9,0)          default 1,
   REC_UPD_DTE          TIMESTAMP            default SYSTIMESTAMP not null,
   constraint PK_POOLED_KEY primary key (POOLED_KEY_UUID)
);

/*==============================================================*/
/* Index: UK_POOLED_KEY                                         */
/*==============================================================*/
create unique index UK_POOLED_KEY on POOLED_KEY (
   KEY_NAME ASC
);

/*==============================================================*/
/* Table: ROLE_UNIT                                             */
/*==============================================================*/
create table ROLE_UNIT 
(
   ROLE_UNIT_UUID       CHAR(32)             not null,
   CODE                 VARCHAR2(4000),
   NAME                 VARCHAR2(200),
   REC_UPD_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   REC_UPD_USER_ID      VARCHAR2(16),
   constraint PK_ROLE_UNIT primary key (ROLE_UNIT_UUID)
         ENABLE,
   constraint ROLE_UNIT_UK1 unique (CODE)
         ENABLE
);

/*==============================================================*/
/* View: V_FRM_SYSTEM_ID                                        */
/*==============================================================*/
create or replace force view V_FRM_SYSTEM_ID as
SELECT DISTINCT S.FRM_SYSTEM_ID, S.FRM_SUBSYSTEM_ID , F.FRM_FUNCTION_ID, AG.FRM_ACTION_GROUP_ID,AC.FRM_ACTION_ID
            FROM
                FRM_SUBSYSTEM S   LEFT OUTER JOIN  FRM_FUNCTION  F ON S.FRM_SUBSYSTEM_UUID=F.FRM_SUBSYSTEM_UUID
                LEFT OUTER JOIN  FRM_ACTION_GROUP AG   ON F.FRM_ACTION_GROUP_UUID=AG.FRM_ACTION_GROUP_UUID  
                LEFT OUTER JOIN  FRM_ACTION AC  ON AG.FRM_ACTION_GROUP_UUID=AC.FRM_ACTION_GROUP_UUID  AND AC.IS_PUBLIC =0;

/*==============================================================*/
/* View: V_GLOBAL_CARRIERS                                      */
/*==============================================================*/
create or replace view V_GLOBAL_CARRIERS as
SELECT * FROM GLOBAL_CARRIERS;

/*==============================================================*/
/* View: V_GLOBAL_SERVICE_NAMESPACE                             */
/*==============================================================*/
create or replace view V_GLOBAL_SERVICE_NAMESPACE as
select * FROM GLOBAL_SERVICE_NAMESPACE;

alter table DATA_ACCESS_SCOPE
   add constraint FK_DATA_ACC_REFERENCE_USER foreign key (USER_ID)
      references DATA_ACCESS_USER (USER_ID);

alter table DATA_ACCESS_SCOPE_UNIT
   add constraint FK_DATA_ACC_REF_SCOPE foreign key (DATA_ACCESS_SCOPE_UUID)
      references DATA_ACCESS_SCOPE (DATA_ACCESS_SCOPE_UUID);

alter table FRM_ACTION
   add constraint FK_FRM_ACTI_REFERENCE_FRM_ACTI foreign key (FRM_ACTION_GROUP_UUID)
      references FRM_ACTION_GROUP (FRM_ACTION_GROUP_UUID);

alter table FRM_FUNCTION
   add constraint FK_FRM_FUNC_REFERENCE_FRM_ACTI foreign key (FRM_ACTION_GROUP_UUID)
      references FRM_ACTION_GROUP (FRM_ACTION_GROUP_UUID);

alter table FRM_FUNCTION
   add constraint FK_FRM_FUNC_REFERENCE_FRM_SUBS foreign key (FRM_SUBSYSTEM_UUID)
      references FRM_SUBSYSTEM (FRM_SUBSYSTEM_UUID);

alter table FRM_FUNCTION_MENU
   add constraint FK_FRM_FUNC_MENU_PARENT foreign key (PARENT_FRM_FUNCTION_MENU_UUID)
      references FRM_FUNCTION_MENU (FRM_FUNCTION_MENU_UUID);

alter table GLOBAL_SERVICE_NAMESPACE
   add constraint FK_GLOBAL_S_REFERENCE_GLOBAL_C foreign key (GLOBAL_CARRIERS_UUID)
      references GLOBAL_CARRIERS (GLOBAL_CARRIERS_UUID);

