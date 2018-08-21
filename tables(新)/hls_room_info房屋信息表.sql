WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool hls_room_info.log

prompt
prompt Creating table hls_room_info
prompt ===========================
prompt
whenever sqlerror continue
drop table hls_room_info;
whenever sqlerror exit failure rollback

-- Create table
create table hls_room_info
(room_id number not null ,
 room_no varchar2(30) not null,
 room_abbr varchar2(30) not null,
 room_type varchar2(30) not null,
 room_area varchar2(30) not null,
 bed number not NUll,
 bed_used number not null,
 bed_free number not null,
 landlord_name varchar2(30) not null,
 landlord_tel varchar2(30) not null,
 intermediary varchar2(30) not null,  
 intermediary_name varchar2(30) not null,
 intermediary_tel varchar2(30) not null,
 message varchar2(1000),
 room_addr_country varchar2(200) not null,
 room_addr_province varchar2(200) not null, 
 room_addr_city varchar2(200) not null,  
 room_status varchar2(2000) not null,
 creation_date date default sysdate not null,
 created_by number default -1 not null,
 last_updated_by number default -1 not null,
 last_update_date date default sysdate not null
);
comment on table hls_room_info is '������Ϣ��';
comment on column hls_room_info.room_id is '����ID';
comment on column hls_room_info.room_no is '���ݱ��';
comment on column hls_room_info.room_abbr is '���ݼ��';
comment on column hls_room_info.room_type is '��������';
comment on column hls_room_info.room_area is '�������';
comment on column hls_room_info.bed is '��λ';
comment on column hls_room_info.bed_used is '���ô�λ';
comment on column hls_room_info.bed_free is 'ʣ�ലλ';
comment on column hls_room_info.landlord_name is '��������';
comment on column hls_room_info.landlord_tel is '��ϵ�绰';
comment on column hls_room_info.intermediary is '�н�����';
comment on column hls_room_info.intermediary_name is '�н���ϵ��';
comment on column hls_room_info.intermediary_tel is '�н���ϵ�绰';
comment on column hls_room_info.message is '��ע';
comment on column hls_room_info.room_addr_country is '����';
comment on column hls_room_info.room_addr_province is 'ʡ';
comment on column hls_room_info.room_addr_city is '��';
comment on column hls_room_info.room_status is '����״̬';
comment on column hls_room_info.creation_date is '��������';
comment on column hls_room_info.created_by is '������';
comment on column hls_room_info.last_update_date is'����޸�����';
comment on column hls_room_info.last_updated_by is '����޸���';

-- create/recreate primary, unique and foreign key constraints 
alter table hls_room_info
  add constraint hls_room_info_pk primary key (room_id);

create index hls_room_info_n1 on hls_room_info(room_id,room_no);

spool off
exit
