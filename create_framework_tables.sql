
/*==============================================================*/
/* System's Global tables for framework                         */
/*==============================================================*/ 

 create table SYSTEM.GLOBAL_CARRIERS  (
   GLOBAL_CARRIERS_UUID CHAR(32)                        not null,
   CARRIER_CODE         VARCHAR2(10),
   CARRIER_NAME_KEY     VARCHAR2(50),
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
commit;

create or replace view  V_GLOBAL_CARRIERS
AS
SELECT * FROM SYSTEM.GLOBAL_CARRIERS;
/

 

create or replace view V_GLOBAL_SERVICE_NAMESPACE as
select * FROM SYSTEM.GLOBAL_SERVICE_NAMESPACE;
/
 
  