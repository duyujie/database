/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     2013/11/13 22:58:21                          */
/*==============================================================*/


alter table DATA_ACCESS_SCOPE
   drop constraint FK_DATA_ACC_REFERENCE_USER;

alter table DATA_ACCESS_SCOPE_UNIT
   drop constraint FK_DATA_ACC_REF_SCOPE;

alter table DATA_ACCESS_USER
   drop constraint FK_DATA_ACC_USER_MASTER;

alter table FRM_ACTION
   drop constraint FK_FRM_ACTI_REFERENCE_FRM_ACTI;

alter table FRM_FUNCTION
   drop constraint FK_FRM_FUNC_REFERENCE_FRM_SUBS;

alter table FRM_FUNCTION
   drop constraint FK_FRM_FUNC_FK_FRM_FU_FRM_ACTI;

alter table FRM_FUNCTION_MENU
   drop constraint FK_FRM_FUNC_MENU_PARENT;

alter table FRM_MASTER_DATA
   drop constraint FK_FRM_MDT_LISTENER;

alter table FRM_RELEASE_VER_FILE
   drop constraint FK_FRM_RELE_REFERENCE_FRM_RELE;

alter table FRM_SPIDER_CHANNEL
   drop constraint FK_SPIDER_CHANNEL_SITE;

alter table FRM_SPIDER_NEWS
   drop constraint REF_SPIDER_NEWS_PAGE;

alter table FRM_SPIDER_PAGE
   drop constraint FK_SPIDER_PAGE_CHANNEL;

alter table GLOBAL_SERVICE_NAMESPACE
   drop constraint FK_GLOBAL_S_REFERENCE_GLOBAL_C;

drop view V_DATA_ACCESS_UNIT;

drop view V_FRM_SYSTEM_ID;

drop view V_GLOBAL_CARRIERS;

drop view V_GLOBAL_SERVICE_NAMESPACE;

drop index IDX_DT_ACC_ABANDON_TK;

drop index IDX_DT_ACC_ABANDON_DT;

drop index IDX_DT_ACC_ABANDON_USR;

drop table DATA_ACCESS_ABANDON cascade constraints;

drop index IDX_DATA_ACC_SCOPE_HIERA;

drop index IDX_DATA_ACC_SCOPE_USER;

drop table DATA_ACCESS_SCOPE cascade constraints;

drop index IDX_DATA_ACC_SCO_UNIT_UNIT;

drop index IDX_DATAACCSCO_UUID;

drop table DATA_ACCESS_SCOPE_UNIT cascade constraints;

drop index IDX_DATA_ACC_MASTER;

drop table DATA_ACCESS_USER cascade constraints;

drop index IDX_FRM_ACTION_GROUPID;

drop table FRM_ACTION cascade constraints;

drop index AK_KEY_FRM_ACTION_GRO_FRM_ACTI;

drop table FRM_ACTION_GROUP cascade constraints;

drop index IDX_ARC_SRC;

drop index IDX_ARC_TO;

drop index IDX_ARC_FROM;

drop index IDX_ARC_FILE;

drop index IDX_ARC_TYPE;

drop table FRM_ARCHIVE cascade constraints;

drop index IDX_BIRT_RQ_DT;

drop index IDX_BIRT_RQ_NEXTRUNDT;

drop index IDX_BIRT_RQ_USER;

drop index IDX_BIRT_RQ_PRI;

drop index IDX_BIRT_RQ_ID;

drop index IDX_BIRT_RQ_STATUS;

drop table FRM_BIRT_REQUEST cascade constraints;

drop index IDX_FRM_DT_VER_TYPE;

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

drop index IDX_LOGIN_HIS_TOKEN;

drop index IDX_LOGIN_HIS_REC_DT;

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

drop index IDX_FRM_MDT_LISTENER;

drop index IDX_FRM_MDT_POLLED;

drop index IDX_FRM_MDT_SEQ;

drop index IDX_FRM_MDT_UUID;

drop index IDX_FRM_MDT_CLASS;

drop table FRM_MASTER_DATA cascade constraints;

drop index IDX_FRM_MDT_LISTENER_ID;

drop table FRM_MASTER_DATA_LISTENER cascade constraints;

drop index FRM_R_VER_F_NAME;

drop table FRM_RELEASE_VER_FILE cascade constraints;

drop index IDX_FRM_R_V_ROOT;

drop table FRM_RELEASE_VER_ROOT cascade constraints;

drop index IDX_SPIDER_CHAN_NAME;

drop index IDX_SPIDER_CHAN_SITE;

drop table FRM_SPIDER_CHANNEL cascade constraints;

drop index IDX_FRM_SPID_N_PAGE;

drop table FRM_SPIDER_NEWS cascade constraints;

drop index IDX_SPIDER_PAGE_TITLE;

drop index IDX_SPIDER_PAGE_CHAN;

drop table FRM_SPIDER_PAGE cascade constraints;

drop index IDX_SPIDER_SITE_NAME;

drop table FRM_SPIDER_SITE cascade constraints;

drop index FRM_SUBSYSTEM_UK1;

drop table FRM_SUBSYSTEM cascade constraints;

drop index IDX_FRM_SVC_EVT_SEQ;

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

drop index IDX_FRM_SYNONYMS;

drop table FRM_SYNONYMS cascade constraints;

drop index IDX_USER_PROF_UID;

drop table FRM_USER_PROFILE cascade constraints;

drop index IDX_GLOB_CARR_CDE;

drop table GLOBAL_CARRIERS cascade constraints;

drop index IDX_GLOBAL_SVC_NMSPACE_CAR;

drop table GLOBAL_SERVICE_NAMESPACE cascade constraints;

drop table GROUP_UNIT cascade constraints;

drop index UK_POOLED_KEY;

drop table POOLED_KEY cascade constraints;

drop table ROLE_UNIT cascade constraints;

drop index IDX_ORG_USER_USERORG;

drop table SSO_ORG_USER cascade constraints;

/*==============================================================*/
/* Table: DATA_ACCESS_ABANDON                                   */
/*==============================================================*/
create table DATA_ACCESS_ABANDON 
(
   DATA_ACCESS_ABANDON_UUID CHAR(32)             not null,
   TOKEN                VARCHAR2(32)         not null,
   USER_ID              VARCHAR2(16),
   ABANDON_STATUS       VARCHAR2(30)         not null,
   REPLACED_BY_USER_ID  VARCHAR2(16),
   REC_UPD_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   constraint PK_DATA_ACCESS_ABANDON primary key (DATA_ACCESS_ABANDON_UUID)
);

/*==============================================================*/
/* Index: IDX_DT_ACC_ABANDON_USR                                */
/*==============================================================*/
create index IDX_DT_ACC_ABANDON_USR on DATA_ACCESS_ABANDON (
   USER_ID ASC
);

/*==============================================================*/
/* Index: IDX_DT_ACC_ABANDON_DT                                 */
/*==============================================================*/
create index IDX_DT_ACC_ABANDON_DT on DATA_ACCESS_ABANDON (
   REC_UPD_DT ASC
);

/*==============================================================*/
/* Index: IDX_DT_ACC_ABANDON_TK                                 */
/*==============================================================*/
create index IDX_DT_ACC_ABANDON_TK on DATA_ACCESS_ABANDON (
   TOKEN ASC
);

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
   MASTER_USER_ID       VARCHAR2(16),
   ROLE_CODES           CLOB,
   GROUP_CODES          CLOB,
   READONLY             NUMERIC(1),
   REC_UPD_DTE          TIMESTAMP            default SYSTIMESTAMP not null,
   REC_UPD_USER_ID      VARCHAR2(16),
   constraint PK_DATA_ACCESS_USER primary key (USER_ID)
         ENABLE
);

/*==============================================================*/
/* Index: IDX_DATA_ACC_MASTER                                   */
/*==============================================================*/
create index IDX_DATA_ACC_MASTER on DATA_ACCESS_USER (
   MASTER_USER_ID ASC
);

/*==============================================================*/
/* Table: FRM_ACTION                                            */
/*==============================================================*/
create table FRM_ACTION 
(
   FRM_ACTION_UUID      CHAR(32)             not null,
   FRM_ACTION_GROUP_UUID CHAR(32),
   FRM_ACTION_ID        VARCHAR2(200),
   IS_PUBLIC            NUMBER(1,0)          default 1,
   IS_TRANSACTION_READONLY NUMBER(1,0)          default 1,
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
         ENABLE
);

/*==============================================================*/
/* Index: AK_KEY_FRM_ACTION_GRO_FRM_ACTI                        */
/*==============================================================*/
create unique index AK_KEY_FRM_ACTION_GRO_FRM_ACTI on FRM_ACTION_GROUP (
   FRM_ACTION_GROUP_ID ASC
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
/* Table: FRM_BIRT_REQUEST                                      */
/*==============================================================*/
create table FRM_BIRT_REQUEST 
(
   FRM_BIRT_REQUEST_UUID CHAR(32)             not null,
   REQUEST_ID           VARCHAR2(50)         not null,
   REQUEST_STATUS       VARCHAR2(10)         not null,
   REQUEST_PRIORITY     NUMERIC(3,0)         default 0 not null,
   REPORT_DESIGN_SVC_FILE BLOB                 not null,
   CONTEXT_MAP          BLOB,
   PARAM_MAP            BLOB,
   REPORT_FORMAT        VARCHAR2(10)         not null,
   REQUEST_USER_ID      VARCHAR2(16)         not null,
   REQUEST_DATE         TIMESTAMP            default SYSTIMESTAMP not null,
   GENERATED_FILE_URL   NVARCHAR2(1000),
   NEXT_RUN_DATE        DATE,
   RUN_REPEAT_TYPE      VARCHAR2(10),
   REC_UPD_USER_ID      VARCHAR2(16)         not null,
   REC_UPD_DTE          TIMESTAMP            default SYSTIMESTAMP not null,
   ERROR_MSG            VARCHAR2(1000),
   constraint PK_FRM_BIRT_REQUEST primary key (FRM_BIRT_REQUEST_UUID)
);

/*==============================================================*/
/* Index: IDX_BIRT_RQ_STATUS                                    */
/*==============================================================*/
create index IDX_BIRT_RQ_STATUS on FRM_BIRT_REQUEST (
   REQUEST_STATUS ASC
);

/*==============================================================*/
/* Index: IDX_BIRT_RQ_ID                                        */
/*==============================================================*/
create unique index IDX_BIRT_RQ_ID on FRM_BIRT_REQUEST (
   REQUEST_ID ASC
);

/*==============================================================*/
/* Index: IDX_BIRT_RQ_PRI                                       */
/*==============================================================*/
create index IDX_BIRT_RQ_PRI on FRM_BIRT_REQUEST (
   REQUEST_PRIORITY ASC
);

/*==============================================================*/
/* Index: IDX_BIRT_RQ_USER                                      */
/*==============================================================*/
create index IDX_BIRT_RQ_USER on FRM_BIRT_REQUEST (
   REQUEST_USER_ID ASC
);

/*==============================================================*/
/* Index: IDX_BIRT_RQ_NEXTRUNDT                                 */
/*==============================================================*/
create index IDX_BIRT_RQ_NEXTRUNDT on FRM_BIRT_REQUEST (
   NEXT_RUN_DATE ASC
);

/*==============================================================*/
/* Index: IDX_BIRT_RQ_DT                                        */
/*==============================================================*/
create index IDX_BIRT_RQ_DT on FRM_BIRT_REQUEST (
   REQUEST_DATE ASC
);

/*==============================================================*/
/* Table: FRM_DATA_VER                                          */
/*==============================================================*/
create table FRM_DATA_VER 
(
   FRM_DATA_VER_UUID    CHAR(32)             not null,
   DATA_UUID            CHAR(32)             not null,
   DATA_XML             CLOB,
   DATA_VER             NUMERIC(22,0)        not null,
   DATA_TYPE            NVARCHAR2(200),
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
/* Index: IDX_FRM_DT_VER_TYPE                                   */
/*==============================================================*/
create index IDX_FRM_DT_VER_TYPE on FRM_DATA_VER (
   DATA_TYPE ASC
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
    store as (tablespace SUITELOBS);

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
   TOKEN                VARCHAR2(32)         not null,
   USER_ID              VARCHAR2(16)         not null,
   IP_FROM              varchar2(50),
   LOGIN_DT             TIMESTAMP,
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
/* Index: IDX_LOGIN_HIS_REC_DT                                  */
/*==============================================================*/
create index IDX_LOGIN_HIS_REC_DT on FRM_LOGIN_HISTORY (
   REC_UPD_DT ASC
);

/*==============================================================*/
/* Index: IDX_LOGIN_HIS_TOKEN                                   */
/*==============================================================*/
create index IDX_LOGIN_HIS_TOKEN on FRM_LOGIN_HISTORY (
   TOKEN ASC
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
    store as (tablespace SUITELOBS);

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
/* Table: FRM_MASTER_DATA                                       */
/*==============================================================*/
create table FRM_MASTER_DATA 
(
   FRM_MASTER_DATA_UUID CHAR(32)             not null,
   FRM_MASTER_DATA_LISTENER_UUID CHAR(32),
   ENTITY_CLASS         VARCHAR2(1000)       not null,
   ENTITY_UUID          CHAR(32)             not null,
   EVENT_SEQ            NUMERIC(22)          not null,
   DATA_STATUS          VARCHAR2(10)         not null,
   POLLED               NUMERIC(1)           default 0 not null,
   POLL_STATUS          VARCHAR2(10),
   POLL_REMARK          NVARCHAR2(1000),
   REC_UPD_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   constraint PK_FRM_MASTER_DATA primary key (FRM_MASTER_DATA_UUID)
);

/*==============================================================*/
/* Index: IDX_FRM_MDT_CLASS                                     */
/*==============================================================*/
create index IDX_FRM_MDT_CLASS on FRM_MASTER_DATA (
   ENTITY_CLASS ASC
);

/*==============================================================*/
/* Index: IDX_FRM_MDT_UUID                                      */
/*==============================================================*/
create index IDX_FRM_MDT_UUID on FRM_MASTER_DATA (
   ENTITY_UUID ASC
);

/*==============================================================*/
/* Index: IDX_FRM_MDT_SEQ                                       */
/*==============================================================*/
create index IDX_FRM_MDT_SEQ on FRM_MASTER_DATA (
   EVENT_SEQ ASC
);

/*==============================================================*/
/* Index: IDX_FRM_MDT_POLLED                                    */
/*==============================================================*/
create index IDX_FRM_MDT_POLLED on FRM_MASTER_DATA (
   POLLED ASC
);

/*==============================================================*/
/* Index: IDX_FRM_MDT_LISTENER                                  */
/*==============================================================*/
create index IDX_FRM_MDT_LISTENER on FRM_MASTER_DATA (
   FRM_MASTER_DATA_LISTENER_UUID ASC
);

/*==============================================================*/
/* Table: FRM_MASTER_DATA_LISTENER                              */
/*==============================================================*/
create table FRM_MASTER_DATA_LISTENER 
(
   FRM_MASTER_DATA_LISTENER_UUID CHAR(32)             not null,
   LISTENER_ID          VARCHAR2(200)        not null,
   ENTITY_CLASSES       CLOB,
   REC_UPD_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   constraint PK_FRM_MASTER_DATA_LISTENER primary key (FRM_MASTER_DATA_LISTENER_UUID)
);

/*==============================================================*/
/* Index: IDX_FRM_MDT_LISTENER_ID                               */
/*==============================================================*/
create unique index IDX_FRM_MDT_LISTENER_ID on FRM_MASTER_DATA_LISTENER (
   LISTENER_ID ASC
);

/*==============================================================*/
/* Table: FRM_RELEASE_VER_FILE                                  */
/*==============================================================*/
create table FRM_RELEASE_VER_FILE 
(
   FRM_RELEASE_VER_FILE_UUID CHAR(32)             not null,
   FRM_RELEASE_VER_ROOT_UUID CHAR(32),
   RELEASE_VER          VARCHAR(20)          not null,
   RELEASE_ENV          VARCHAR(20)          not null,
   FILE_NAME            NVARCHAR2(2000)      not null,
   FILE_MD5             VARCHAR2(32)         not null,
   FILE_SIZE            NUMBER(22,0)         not null,
   FILE_LAST_MODIFIED   NUMBER(22,0)         not null,
   REC_UPD_DTE          TIMESTAMP            default SYSTIMESTAMP not null,
   constraint PK_FRM_RELEASE_VER_FILE primary key (FRM_RELEASE_VER_FILE_UUID)
);

/*==============================================================*/
/* Index: FRM_R_VER_F_NAME                                      */
/*==============================================================*/
create unique index FRM_R_VER_F_NAME on FRM_RELEASE_VER_FILE (
   FILE_NAME ASC,
   RELEASE_VER ASC,
   RELEASE_ENV ASC
);

/*==============================================================*/
/* Table: FRM_RELEASE_VER_ROOT                                  */
/*==============================================================*/
create table FRM_RELEASE_VER_ROOT 
(
   FRM_RELEASE_VER_ROOT_UUID CHAR(32)             not null,
   RELEASE_VER          VARCHAR2(20)         not null,
   RELEASE_ENV          VARCHAR2(20),
   ROOT_PATH            NVARCHAR2(2000)      not null,
   REC_UPD_DTE          TIMESTAMP            default SYSTIMESTAMP not null,
   constraint PK_FRM_RELEASE_VER_ROOT primary key (FRM_RELEASE_VER_ROOT_UUID)
);

/*==============================================================*/
/* Index: IDX_FRM_R_V_ROOT                                      */
/*==============================================================*/
create unique index IDX_FRM_R_V_ROOT on FRM_RELEASE_VER_ROOT (
   ROOT_PATH ASC,
   RELEASE_VER ASC,
   RELEASE_ENV ASC
);

/*==============================================================*/
/* Table: FRM_SPIDER_CHANNEL                                    */
/*==============================================================*/
create table FRM_SPIDER_CHANNEL 
(
   FRM_SPIDER_CHANNEL_UUID CHAR(32)             not null,
   FRM_SPIDER_SITE_UUID CHAR(32)             not null,
   CHANNEL_NAME         NVARCHAR2(500)       not null,
   CHANNEL_URL          VARCHAR2(2048)       not null,
   CHANNEL_SRC          VARCHAR2(2048),
   CHANNEL_CHARSET      VARCHAR2(10),
   CHANNEL_PAGE_PATTERN VARCHAR2(1024),
   CRAWL_STATUS         VARCHAR2(10),
   REC_UPD_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   constraint PK_FRM_SPIDER_CHANNEL primary key (FRM_SPIDER_CHANNEL_UUID),
   constraint AK_SPID_CHAN_URL unique (CHANNEL_URL)
);

/*==============================================================*/
/* Index: IDX_SPIDER_CHAN_SITE                                  */
/*==============================================================*/
create index IDX_SPIDER_CHAN_SITE on FRM_SPIDER_CHANNEL (
   FRM_SPIDER_SITE_UUID ASC
);

/*==============================================================*/
/* Index: IDX_SPIDER_CHAN_NAME                                  */
/*==============================================================*/
create index IDX_SPIDER_CHAN_NAME on FRM_SPIDER_CHANNEL (
   CHANNEL_NAME ASC
);

/*==============================================================*/
/* Table: FRM_SPIDER_NEWS                                       */
/*==============================================================*/
create table FRM_SPIDER_NEWS 
(
   FRM_SPIDER_NEWS_UUID CHAR(32)             not null,
   FRM_SPIDER_PAGE_UUID CHAR(32),
   REC_UPD_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   constraint PK_FRM_SPIDER_NEWS primary key (FRM_SPIDER_NEWS_UUID)
);

/*==============================================================*/
/* Index: IDX_FRM_SPID_N_PAGE                                   */
/*==============================================================*/
create unique index IDX_FRM_SPID_N_PAGE on FRM_SPIDER_NEWS (
   FRM_SPIDER_PAGE_UUID ASC
);

/*==============================================================*/
/* Table: FRM_SPIDER_PAGE                                       */
/*==============================================================*/
create table FRM_SPIDER_PAGE 
(
   FRM_SPIDER_PAGE_UUID CHAR(32)             not null,
   FRM_SPIDER_CHANNEL_UUID CHAR(32)             not null,
   PAGE_TITLE           NVARCHAR2(200)       not null,
   PAGE_URL             VARCHAR2(2048)       not null,
   PAGE_DATE            DATE                 not null,
   CRAWL_STATUS         VARCHAR2(10),
   REC_UPD_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   constraint PK_FRM_SPIDER_PAGE primary key (FRM_SPIDER_PAGE_UUID)
);

/*==============================================================*/
/* Index: IDX_SPIDER_PAGE_CHAN                                  */
/*==============================================================*/
create index IDX_SPIDER_PAGE_CHAN on FRM_SPIDER_PAGE (
   FRM_SPIDER_CHANNEL_UUID ASC
);

/*==============================================================*/
/* Index: IDX_SPIDER_PAGE_TITLE                                 */
/*==============================================================*/
create index IDX_SPIDER_PAGE_TITLE on FRM_SPIDER_PAGE (
   PAGE_TITLE ASC
);

/*==============================================================*/
/* Table: FRM_SPIDER_SITE                                       */
/*==============================================================*/
create table FRM_SPIDER_SITE 
(
   FRM_SPIDER_SITE_UUID CHAR(32)             not null,
   SITE_MANAGER         VARCHAR2(50),
   SITE_NAME            NVARCHAR2(200),
   SITE_URL             VARCHAR2(2048)       not null,
   REC_UPD_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   constraint PK_FRM_SPIDER_SITE primary key (FRM_SPIDER_SITE_UUID),
   constraint AK_SPID_SITE_URL unique (SITE_URL)
);

/*==============================================================*/
/* Index: IDX_SPIDER_SITE_NAME                                  */
/*==============================================================*/
create index IDX_SPIDER_SITE_NAME on FRM_SPIDER_SITE (
   SITE_NAME ASC
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
   EVENT_NAME           varchar2(200)        not null,
   EVENT_USER_ID        VARCHAR2(16),
   EVENT_DATA_XML       CLOB                 not null,
   EVENT_STATUS         varchar2(20)         not null,
   EVENT_SEQ            NUMERIC(22)          default 0,
   EVENT_SOURCE         varchar2(200),
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
/* Index: IDX_FRM_SVC_EVT_SEQ                                   */
/*==============================================================*/
create index IDX_FRM_SVC_EVT_SEQ on FRM_SVC_EVENT (
   EVENT_SEQ ASC
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
/* Table: FRM_SYNONYMS                                          */
/*==============================================================*/
create table FRM_SYNONYMS 
(
   FRM_SYNONYMS_UUID    CHAR(32)             not null,
   SYNONYMS_TERMS       NVARCHAR2(500)       not null,
   REC_UPD_USER_ID      VARCHAR2(16),
   REC_UPD_DTE          TIMESTAMP            default SYSTIMESTAMP not null,
   constraint PK_FRM_SYNONYMS primary key (FRM_SYNONYMS_UUID)
);

/*==============================================================*/
/* Index: IDX_FRM_SYNONYMS                                      */
/*==============================================================*/
create unique index IDX_FRM_SYNONYMS on FRM_SYNONYMS (
   SYNONYMS_TERMS ASC
);

/*==============================================================*/
/* Table: FRM_USER_PROFILE                                      */
/*==============================================================*/
create table FRM_USER_PROFILE 
(
   FRM_USER_PROFILE_UUID CHAR(32)             not null,
   USER_ID              VARCHAR2(16)         not null,
   PROFILE_TYPE         VARCHAR2(20)         not null,
   USER_PROFILE         CLOB                 not null,
   REC_UPD_DT           TIMESTAMP            default SYSTIMESTAMP not null,
   constraint PK_FRM_USER_PROFILE primary key (FRM_USER_PROFILE_UUID)
);

/*==============================================================*/
/* Index: IDX_USER_PROF_UID                                     */
/*==============================================================*/
create unique index IDX_USER_PROF_UID on FRM_USER_PROFILE (
   USER_ID ASC,
   PROFILE_TYPE ASC
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
   HTTPS_PORT           VARCHAR2(4)          default '8181',
   constraint PK_GLOBAL_CARRIERS primary key (GLOBAL_CARRIERS_UUID),
   constraint AK_KEY_NAME_GLOBAL_CARRIERS unique (CARRIER_NAME_KEY)
);

/*==============================================================*/
/* Index: IDX_GLOB_CARR_CDE                                     */
/*==============================================================*/
create index IDX_GLOB_CARR_CDE on GLOBAL_CARRIERS (
   CARRIER_CODE ASC
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
   HTTPS_PORT           VARCHAR2(80)         default '8443',
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
/* Table: SSO_ORG_USER                                          */
/*==============================================================*/
create table SSO_ORG_USER 
(
   SSO_ORG_USER_UUID    CHAR(32)             not null,
   ORG_ID               VARCHAR2(50),
   USER_ID              VARCHAR2(16)         not null,
   MD5_PASSWORD         VARCHAR2(32)         not null,
   USER_STATUS          VARCHAR2(50),
   IS_ADMIN             NUMERIC(1,0)         default 0 not null,
   REC_UPD_DTE          TIMESTAMP            not null,
   REC_UPD_USER_ID      VARCHAR2(16)         not null,
   constraint PK_SSO_ORG_USER primary key (SSO_ORG_USER_UUID)
);

/*==============================================================*/
/* Index: IDX_ORG_USER_USERORG                                  */
/*==============================================================*/
create unique index IDX_ORG_USER_USERORG on SSO_ORG_USER (
   USER_ID ASC,
   ORG_ID ASC
);

/*==============================================================*/
/* View: V_DATA_ACCESS_UNIT                                     */
/*==============================================================*/
create or replace view V_DATA_ACCESS_UNIT as

     SELECT 
  SYS_GUID() AS DATA_ACCESS_UNIT_UUID,
    NULL               AS DATA_ACCESS_UNIT_PARENT,
    NULL       AS DATA_ACCESS_CODE,
    NULL       AS DATA_ACCESS_NAME,
    NULL    AS DATA_ACCESS_CN_NAME,
   NULL        AS DATA_ACCESS_LEVEL,
  SYSDATE AS  REC_UPD_DT,
  NULL  REC_UPD_USER_ID
  FROM DUAL
    where 1=2


with read only;

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

alter table DATA_ACCESS_USER
   add constraint FK_DATA_ACC_USER_MASTER foreign key (MASTER_USER_ID)
      references DATA_ACCESS_USER (USER_ID);

alter table FRM_ACTION
   add constraint FK_FRM_ACTI_REFERENCE_FRM_ACTI foreign key (FRM_ACTION_GROUP_UUID)
      references FRM_ACTION_GROUP (FRM_ACTION_GROUP_UUID);

alter table FRM_FUNCTION
   add constraint FK_FRM_FUNC_REFERENCE_FRM_SUBS foreign key (FRM_SUBSYSTEM_UUID)
      references FRM_SUBSYSTEM (FRM_SUBSYSTEM_UUID);

alter table FRM_FUNCTION
   add constraint FK_FRM_FUNC_FK_FRM_FU_FRM_ACTI foreign key (FRM_ACTION_GROUP_UUID)
      references FRM_ACTION_GROUP (FRM_ACTION_GROUP_UUID);

alter table FRM_FUNCTION_MENU
   add constraint FK_FRM_FUNC_MENU_PARENT foreign key (PARENT_FRM_FUNCTION_MENU_UUID)
      references FRM_FUNCTION_MENU (FRM_FUNCTION_MENU_UUID);

alter table FRM_MASTER_DATA
   add constraint FK_FRM_MDT_LISTENER foreign key (FRM_MASTER_DATA_LISTENER_UUID)
      references FRM_MASTER_DATA_LISTENER (FRM_MASTER_DATA_LISTENER_UUID);

alter table FRM_RELEASE_VER_FILE
   add constraint FK_FRM_RELE_REFERENCE_FRM_RELE foreign key (FRM_RELEASE_VER_ROOT_UUID)
      references FRM_RELEASE_VER_ROOT (FRM_RELEASE_VER_ROOT_UUID);

alter table FRM_SPIDER_CHANNEL
   add constraint FK_SPIDER_CHANNEL_SITE foreign key (FRM_SPIDER_SITE_UUID)
      references FRM_SPIDER_SITE (FRM_SPIDER_SITE_UUID);

alter table FRM_SPIDER_NEWS
   add constraint REF_SPIDER_NEWS_PAGE foreign key (FRM_SPIDER_PAGE_UUID)
      references FRM_SPIDER_PAGE (FRM_SPIDER_PAGE_UUID);

alter table FRM_SPIDER_PAGE
   add constraint FK_SPIDER_PAGE_CHANNEL foreign key (FRM_SPIDER_CHANNEL_UUID)
      references FRM_SPIDER_CHANNEL (FRM_SPIDER_CHANNEL_UUID);

alter table GLOBAL_SERVICE_NAMESPACE
   add constraint FK_GLOBAL_S_REFERENCE_GLOBAL_C foreign key (GLOBAL_CARRIERS_UUID)
      references GLOBAL_CARRIERS (GLOBAL_CARRIERS_UUID);



SET DEFINE OFF;
--Insert into  GLOBAL_CARRIERS (GLOBAL_CARRIERS_UUID,CARRIER_CODE,CARRIER_NAME_KEY,CARRIER_SERVER_URL,REC_UPD_DTE,BL_PREFIX,SCAC_CDE,HTTPS_PORT) values ('c71a36e2e6d54dc286fa90816d2ef37e','COS','carrier.COS.local','http://localhost:8080/Framework4sWeb/hessian/',to_timestamp('26-10月-11 02.55.21.790000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'COS','COS','8181'); 


Insert into DATA_ACCESS_USER (USER_ID,REC_UPD_DTE,REC_UPD_USER_ID,MASTER_USER_ID,READONLY) values ('system',to_timestamp('13-9月 -13 12.31.16.028000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'system',null,0);


commit;