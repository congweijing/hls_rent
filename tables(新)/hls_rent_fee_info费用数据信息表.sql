WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool hls_rent_fee_info.log

prompt
prompt Creating table hls_rent_fee_info
prompt ===========================
prompt
whenever sqlerror continue
drop table hls_rent_fee_info;
whenever sqlerror exit failure rollback

-- Create table
create table hls_rent_fee_info
(
 fee_id number not null,
 fee_no varchar2(30) not null,
 fee_add_date date not null,
 fee_first_date date not null,
 fee_last_date date not null,
 fee_items varchar2(30) not null,
 fee_sources varchar2(30) not null,
 fee_objects varchar2(30) not null,
 fee_amounts varchar2(30) not null,
 fee_currency varchar2(10) default 'CNY' not null, 
 message varchar2(1000),
 created_by number,
 creation_date date,
 last_updated_by number,
 last_update_date date
  );
comment on table hls_rent_fee_info is '费用数据信息表';

comment on column hls_rent_fee_info.fee_id is 'FEE_ID';
comment on column hls_rent_fee_info.fee_no is '费用单编号';
comment on column hls_rent_fee_info.fee_add_date is '新增日期';
comment on column hls_rent_fee_info.fee_first_date is '费用开始日期';
comment on column hls_rent_fee_info.fee_last_date is '费用结束日期';
comment on column hls_rent_fee_info.fee_items is '费用项目(电费、水费、宽带网络费、有线电视费)';
comment on column hls_rent_fee_info.fee_sources is '费用来源(房屋)';
comment on column hls_rent_fee_info.fee_objects is '费用对象';
comment on column hls_rent_fee_info.fee_amounts is '费用金额';
comment on column hls_rent_fee_info.fee_currency is '币种(人民币)';
comment on column hls_rent_fee_info.message is '备注';
comment on column hls_rent_fee_info.created_by is '默认';
comment on column hls_rent_fee_info.creation_date is '默认';
comment on column hls_rent_fee_info.last_updated_by is '默认';
comment on column hls_rent_fee_info.last_update_date is '默认';

-- create/recreate primary, unique and foreign key constraints 
alter table hls_rent_fee_info
  add constraint hls_rent_fee_info_pk primary key (fee_id);

create index hls_rent_fee_info_n1 on hls_rent_fee_info(fee_id,fee_no);

spool off
exit

