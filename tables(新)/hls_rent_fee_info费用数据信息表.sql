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
comment on table hls_rent_fee_info is '����������Ϣ��';

comment on column hls_rent_fee_info.fee_id is 'FEE_ID';
comment on column hls_rent_fee_info.fee_no is '���õ����';
comment on column hls_rent_fee_info.fee_add_date is '��������';
comment on column hls_rent_fee_info.fee_first_date is '���ÿ�ʼ����';
comment on column hls_rent_fee_info.fee_last_date is '���ý�������';
comment on column hls_rent_fee_info.fee_items is '������Ŀ(��ѡ�ˮ�ѡ��������ѡ����ߵ��ӷ�)';
comment on column hls_rent_fee_info.fee_sources is '������Դ(����)';
comment on column hls_rent_fee_info.fee_objects is '���ö���';
comment on column hls_rent_fee_info.fee_amounts is '���ý��';
comment on column hls_rent_fee_info.fee_currency is '����(�����)';
comment on column hls_rent_fee_info.message is '��ע';
comment on column hls_rent_fee_info.created_by is 'Ĭ��';
comment on column hls_rent_fee_info.creation_date is 'Ĭ��';
comment on column hls_rent_fee_info.last_updated_by is 'Ĭ��';
comment on column hls_rent_fee_info.last_update_date is 'Ĭ��';

-- create/recreate primary, unique and foreign key constraints 
alter table hls_rent_fee_info
  add constraint hls_rent_fee_info_pk primary key (fee_id);

create index hls_rent_fee_info_n1 on hls_rent_fee_info(fee_id,fee_no);

spool off
exit

