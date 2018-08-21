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
comment on table HLS_Contract_info  is '租房合同信息表';
comment on column HLS_Contract_info.contract_ID is '房屋合同ID';
comment on column HLS_Contract_info.h_contract_number is '房屋合同编号';
comment on column HLS_Contract_info.contract_start_date is '合同开始日期';
comment on column HLS_Contract_info.contract_finish_date is '合同结束日期';
comment on column HLS_Contract_info.room_id is '房屋ID';
comment on column HLS_Contract_info.contract_condition is '房屋合同状态';
comment on column HLS_Contract_info.month_rent_price is '月租金';
comment on column HLS_Contract_info.tenancy_term is '租期';
comment on column HLS_Contract_info.agency_fee is '中介费';
comment on column HLS_Contract_info.Contract_invoice_tax is '合同发票税费';
comment on column HLS_Contract_info.sum_price is '总租金';
comment on column HLS_Contract_info.currency is '币种';
comment on column HLS_Contract_info.remark is '备注';
comment on column HLS_Contract_info.contract_remark is '合同备注';
comment on column HLS_Contract_info.CREATION_DATE is '创建日期';
comment on column HLS_Contract_info.CREATED_BY is '创建人';
comment on column HLS_Contract_info.LAST_UPDATE_DATE is'最后修改日期';
comment on column HLS_Contract_info.LAST_UPDATED_BY is '最后修改人';

-- create/recreate primary, unique and foreign key constraints 
alter table hls_contract_info
  add constraint hls_contract_info_pk primary key (contract_id);

create index hls_contract_info_n1 on hls_contract_info(contract_id,h_contract_number);

spool off
exit
