WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool hls_contract_info.log

prompt
prompt Creating table hls_Contract_info
prompt ===========================
prompt
whenever sqlerror continue
drop table hls_Contract_info;
whenever sqlerror exit failure rollback

-- Create table
Create Table HLS_Contract_info 
(contract_ID Number Not Null,
 h_contract_number varchar2(30),
 contract_start_date date Not Null,
 contract_finish_date date Not Null,
 room_id number Not Null,
 contract_condition varchar2(30) Not Null,
 month_rent_price number(30) Not Null,
 tenancy_term number(30) Not Null,  
 agency_fee number(30) Not null,
 Contract_invoice_tax number(30) not null,
 sum_price number(30),
 currency varchar2(30),   
 remark varchar2(30),
 contract_remark varchar2(30),
 /*MACHINE_NUMBER Varchar2(4000) Not Null,*/
 CREATION_DATE DATE default sysdate not null,
 CREATED_BY NUMBER default -1 not null,
 LAST_UPDATED_BY NUMBER default -1 not null,
 LAST_UPDATE_DATE DATE default sysdate not null
);
comment on table HLS_Contract_info  is '�ⷿ��ͬ��Ϣ��';
comment on column HLS_Contract_info.contract_ID is '���ݺ�ͬID';
comment on column HLS_Contract_info.h_contract_number is '���ݺ�ͬ���';
comment on column HLS_Contract_info.contract_start_date is '��ͬ��ʼ����';
comment on column HLS_Contract_info.contract_finish_date is '��ͬ��������';
comment on column HLS_Contract_info.room_id is '����ID';
comment on column HLS_Contract_info.contract_condition is '���ݺ�ͬ״̬';
comment on column HLS_Contract_info.month_rent_price is '�����';
comment on column HLS_Contract_info.tenancy_term is '����';
comment on column HLS_Contract_info.agency_fee is '�н��';
comment on column HLS_Contract_info.Contract_invoice_tax is '��ͬ��Ʊ˰��';
comment on column HLS_Contract_info.sum_price is '�����';
comment on column HLS_Contract_info.currency is '����';
comment on column HLS_Contract_info.remark is '��ע';
comment on column HLS_Contract_info.contract_remark is '��ͬ��ע';
comment on column HLS_Contract_info.CREATION_DATE is '��������';
comment on column HLS_Contract_info.CREATED_BY is '������';
comment on column HLS_Contract_info.LAST_UPDATE_DATE is'����޸�����';
comment on column HLS_Contract_info.LAST_UPDATED_BY is '����޸���';

-- create/recreate primary, unique and foreign key constraints 
alter table hls_contract_info
  add constraint hls_contract_info_pk primary key (contract_id);

create index hls_contract_info_n1 on hls_contract_info(contract_id,h_contract_number);

spool off
exit
