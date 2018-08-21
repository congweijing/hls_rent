WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool hls_hsm.log

prompt
prompt Creating table hls_hsm
prompt ===========================
prompt
whenever sqlerror continue
drop table hls_hsm;
whenever sqlerror exit failure rollback

-- Create table
create table hls_hsm
(
people_id number not null,
personnel_no varchar2(200) not null,
staff_no varchar2(200) not null,
name varchar2(200) not null,
gender varchar2(20) not null,
department varchar2(20) not null,
base_in varchar2(20) not null,
phone_number varchar2(100) not null,
people_status varchar2(20) not null,
email varchar2(100) not null,
message varchar2(500) ,
contract_no varchar2(30),
leaving_date date,
live_start_date date,
created_by number,
creation_date date,
last_updated_by number,
last_update_date date
);
comment on table hls_hsm is '入住人员信息表';

comment on column hls_hsm.people_id is '入住人员ID';
comment on column hls_hsm.personnel_no is '入住人员编号';
comment on column hls_hsm.staff_no is '入住人员工号';
comment on column hls_hsm.name is '入住人员姓名';
comment on column hls_hsm.gender is '入住人员性别';
comment on column hls_hsm.department is '所在部门';
comment on column hls_hsm.base_in is 'base地';
comment on column hls_hsm.phone_number is '联系电话';
comment on column hls_hsm.people_status is '入住人员状态';
comment on column hls_hsm.email is '邮箱地址';
comment on column hls_hsm.message is '备注';
comment on column hls_hsm.contract_no is '房屋合同编号';
comment on column hls_hsm.leaving_date is '欲入住至（时间）';
comment on column hls_hsm.live_start_date is '入住起始日期（已入住）';
comment on column hls_hsm.created_by is '默认';
comment on column hls_hsm.creation_date is '默认';
comment on column hls_hsm.last_updated_by is '默认';
comment on column hls_hsm.last_update_date is '退房日期（已退房）';

-- create/recreate primary, unique and foreign key constraints 
alter table hls_hsm
  add constraint hls_hsm_pk primary key (people_id);

create index hls_hsm_n1 on hls_hsm(people_id,personnel_no);

spool off
exit
