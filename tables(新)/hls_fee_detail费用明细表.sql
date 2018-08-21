WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool hls_fee_detail.log

prompt
prompt Creating table hls_fee_detail
prompt ===========================
prompt
whenever sqlerror continue
drop table hls_fee_detail;
whenever sqlerror exit failure rollback

-- Create table
create table hls_fee_detail
(
 fee_detail_id number not null,
 periods varchar2(30),
 staff_no varchar(30) not null, 
 apportion_rental number(7,2),
 apportion_water number(7,2),
 apportion_electric number(7,2),
 apportion_network number(7,2),
 apportion_cable number(7,2),
 fee_currency varchar2(10) default 'CNY' not null, 
 created_by number default 1 not null,
 creation_date date default sysdate not null,
 last_updated_by number default -1 not null,
 last_update_date date default sysdate not null
  );
comment on table hls_fee_detail is '费用数据信息表';

comment on column hls_fee_detail.fee_detail_id is '明细id';
comment on column hls_fee_detail.periods is '期数';
comment on column hls_fee_detail.staff_no is '编号';
comment on column hls_fee_detail.apportion_rental is '分摊租金';
comment on column hls_fee_detail.apportion_water is '分摊水费';
comment on column hls_fee_detail.apportion_electric is '分摊电费';
comment on column hls_fee_detail.apportion_network is '分摊宽带网络费用';
comment on column hls_fee_detail.apportion_cable is '分摊有线电视费用';
comment on column hls_fee_detail.fee_currency is '币种(人民币)';
comment on column hls_fee_detail.created_by is '默认';
comment on column hls_fee_detail.creation_date is '默认';
comment on column hls_fee_detail.last_updated_by is '默认';
comment on column hls_fee_detail.last_update_date is '默认';

-- create/recreate primary, unique and foreign key constraints 
alter table hls_fee_detail
  add constraint hls_fee_detail_pk primary key (fee_detail_id);

spool off
exit

