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
comment on table hls_hsm is '��ס��Ա��Ϣ��';

comment on column hls_hsm.people_id is '��ס��ԱID';
comment on column hls_hsm.personnel_no is '��ס��Ա���';
comment on column hls_hsm.staff_no is '��ס��Ա����';
comment on column hls_hsm.name is '��ס��Ա����';
comment on column hls_hsm.gender is '��ס��Ա�Ա�';
comment on column hls_hsm.department is '���ڲ���';
comment on column hls_hsm.base_in is 'base��';
comment on column hls_hsm.phone_number is '��ϵ�绰';
comment on column hls_hsm.people_status is '��ס��Ա״̬';
comment on column hls_hsm.email is '�����ַ';
comment on column hls_hsm.message is '��ע';
comment on column hls_hsm.contract_no is '���ݺ�ͬ���';
comment on column hls_hsm.leaving_date is '����ס����ʱ�䣩';
comment on column hls_hsm.live_start_date is '��ס��ʼ���ڣ�����ס��';
comment on column hls_hsm.created_by is 'Ĭ��';
comment on column hls_hsm.creation_date is 'Ĭ��';
comment on column hls_hsm.last_updated_by is 'Ĭ��';
comment on column hls_hsm.last_update_date is '�˷����ڣ����˷���';

-- create/recreate primary, unique and foreign key constraints 
alter table hls_hsm
  add constraint hls_hsm_pk primary key (people_id);

create index hls_hsm_n1 on hls_hsm(people_id,personnel_no);

spool off
exit
