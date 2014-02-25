-- APP_USERS
delete from APP_USERS;

SET DEFINE OFF;

--密码System~098
Insert into APP_USERS (APP_USERS_UUID,USER_ID,USER_PASSWORD,STATUS,REC_UPD_DTE,USER_NAME_EN,USER_NAME_CN,EMAIL,FAX,TEL,COMPANY_NAME,DEPART_NAME,DEFAULT_PORT,APPROVER,REC_UPD_USER_ID) 
	values ('0721d2e96ae54d62b32c485d093d798f','system','3a2130036c90a9e0a153033487ee1bde','Active',sysdate,'system','system','duyj@coscon.com',null,null,null,null,null,null,'system');

Insert into APP_USERS (APP_USERS_UUID,USER_ID,USER_PASSWORD,STATUS,REC_UPD_DTE,USER_NAME_EN,USER_NAME_CN,EMAIL,FAX,TEL,COMPANY_NAME,DEPART_NAME,DEFAULT_PORT,APPROVER,REC_UPD_USER_ID) 
	values ('6b08097382a64496b3d785d5f4d3d1f8','ebsystem','46d6e7ddb00ffc7de44e15663fd4bb31','Active',sysdate,'ebsystem','ebsystem','duyj@coscon.com',null,null,null,null,null,null,'system');
	
Insert into APP_USERS (APP_USERS_UUID,USER_ID,USER_PASSWORD,STATUS,REC_UPD_DTE,USER_NAME_EN,USER_NAME_CN,EMAIL,FAX,TEL,COMPANY_NAME,DEPART_NAME,DEFAULT_PORT,APPROVER,REC_UPD_USER_ID) 
	values ('1208097382a64496b3d785d5f4d3d1f8','anonymous','dd7b0b1ebecfe55101960f5eb8fc55b2','Active',sysdate,'anonymous','anonymous','duyj@coscon.com',null,null,null,null,null,null,'system');
	

 

Insert into  DATA_ACCESS_USER (USER_ID,REC_UPD_DTE,REC_UPD_USER_ID,MASTER_USER_ID,READONLY) values ('ebsystem',to_timestamp('16-5月 -12 09.10.57.454000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'poc',null,0);
Insert into  DATA_ACCESS_USER (USER_ID,REC_UPD_DTE,REC_UPD_USER_ID,MASTER_USER_ID,READONLY) values ('poc',to_timestamp('06-1月 -13 10.00.43.640000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'poc',null,0);
Insert into  DATA_ACCESS_USER (USER_ID,REC_UPD_DTE,REC_UPD_USER_ID,MASTER_USER_ID,READONLY) values ('anonymous',to_timestamp('27-4月 -12 09.57.54.467000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'system',null,0); 

commit;  