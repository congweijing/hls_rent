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
comment on table hls_fee_detail is '����������Ϣ��';

comment on column hls_fee_detail.fee_detail_id is '��ϸid';
comment on column hls_fee_detail.periods is '����';
comment on column hls_fee_detail.staff_no is '���';
comment on column hls_fee_detail.apportion_rental is '��̯���';
comment on column hls_fee_detail.apportion_water is '��̯ˮ��';
comment on column hls_fee_detail.apportion_electric is '��̯���';
comment on column hls_fee_detail.apportion_network is '��̯����������';
comment on column hls_fee_detail.apportion_cable is '��̯���ߵ��ӷ���';
comment on column hls_fee_detail.fee_currency is '����(�����)';
comment on column hls_fee_detail.created_by is 'Ĭ��';
comment on column hls_fee_detail.creation_date is 'Ĭ��';
comment on column hls_fee_detail.last_updated_by is 'Ĭ��';
comment on column hls_fee_detail.last_update_date is 'Ĭ��';

-- create/recreate primary, unique and foreign key constraints 
alter table hls_fee_detail
  add constraint hls_fee_detail_pk primary key (fee_detail_id);

spool off
exit

