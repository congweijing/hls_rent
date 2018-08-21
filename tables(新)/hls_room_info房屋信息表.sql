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
comment on table hls_room_info is '房屋信息表';
comment on column hls_room_info.room_id is '房屋ID';
comment on column hls_room_info.room_no is '房屋编号';
comment on column hls_room_info.room_abbr is '房屋简称';
comment on column hls_room_info.room_type is '房屋类型';
comment on column hls_room_info.room_area is '房屋面积';
comment on column hls_room_info.bed is '床位';
comment on column hls_room_info.bed_used is '已用床位';
comment on column hls_room_info.bed_free is '剩余床位';
comment on column hls_room_info.landlord_name is '房东姓名';
comment on column hls_room_info.landlord_tel is '联系电话';
comment on column hls_room_info.intermediary is '中介名称';
comment on column hls_room_info.intermediary_name is '中介联系人';
comment on column hls_room_info.intermediary_tel is '中介联系电话';
comment on column hls_room_info.message is '备注';
comment on column hls_room_info.room_addr_country is '国家';
comment on column hls_room_info.room_addr_province is '省';
comment on column hls_room_info.room_addr_city is '市';
comment on column hls_room_info.room_status is '房屋状态';
comment on column hls_room_info.creation_date is '创建日期';
comment on column hls_room_info.created_by is '创建人';
comment on column hls_room_info.last_update_date is'最后修改日期';
comment on column hls_room_info.last_updated_by is '最后修改人';

-- create/recreate primary, unique and foreign key constraints 
alter table hls_room_info
  add constraint hls_room_info_pk primary key (room_id);

create index hls_room_info_n1 on hls_room_info(room_id,room_no);

spool off
exit
