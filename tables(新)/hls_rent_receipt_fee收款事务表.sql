WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool hls_rent_receipt_fee.log

prompt
prompt Creating table hls_rent_receipt_fee
prompt ===========================
prompt
whenever sqlerror continue
drop table hls_rent_receipt_fee;
whenever sqlerror exit failure rollback

-- Create table
create table hls_rent_receipt_fee
(
 receipt_id number not null,
 receipt_no varchar2(30) not null,
 receipt_sources varchar2(30) not null,
 receipt_objects varchar2(30) not null,
 receipt_ways varchar2(30) not null,
 receipt_date date not null,
 receipt_amounts varchar2(30) not null,
 verification_amounts varchar2(30) not null,
 currency varchar2(10) default 'CNY' not null, 
 contract_no varchar2(30) not null,
 verification_no varchar2(30),
 message varchar2(1000),
 created_by number,
 creation_date date,
 last_updated_by number,
 last_update_date date
  );
comment on table hls_rent_receipt_fee is '收款事务表';

comment on column hls_rent_receipt_fee.receipt_id is 'RECEIPT_ID';
comment on column hls_rent_receipt_fee.receipt_no is '收款编号';
comment on column hls_rent_receipt_fee.receipt_sources is '收款来源(入住人员，其他)';
comment on column hls_rent_receipt_fee.receipt_objects is '收款对象(入住人员信息)';
comment on column hls_rent_receipt_fee.receipt_ways is '收款方式(现金or转账)';
comment on column hls_rent_receipt_fee.receipt_date is '收款日期';
comment on column hls_rent_receipt_fee.receipt_amounts is '收款金额';
comment on column hls_rent_receipt_fee.verification_amounts is '核销金额';
comment on column hls_rent_receipt_fee.currency is '币种';
comment on column hls_rent_receipt_fee.contract_no is '合同编号';
comment on column hls_rent_receipt_fee.verification_no is '核销编号';
comment on column hls_rent_receipt_fee.message is '备注';
comment on column hls_rent_receipt_fee.created_by is '默认';
comment on column hls_rent_receipt_fee.creation_date is '默认';
comment on column hls_rent_receipt_fee.last_updated_by is '默认';
comment on column hls_rent_receipt_fee.last_update_date is '默认';

-- create/recreate primary, unique and foreign key constraints 
alter table hls_rent_receipt_fee
  add constraint hls_rent_receipt_fee_pk primary key (receipt_id);

create index hls_rent_receipt_fee_n1 on hls_rent_receipt_fee(receipt_id,receipt_no);

spool off
exit

