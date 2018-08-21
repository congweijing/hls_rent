WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool hls_payment_verification.log

prompt
prompt Creating table hls_payment_verification
prompt ===========================
prompt
whenever sqlerror continue
drop table hls_payment_verification;
whenever sqlerror exit failure rollback

-- Create table
create table hls_payment_verification
(
 verification_id number not null,
 verification_no varchar2(30),
 contract_no varchar2(30),
 creditor_project varchar2(30),
 verification_date date,
 source_type varchar2(30),
 source_object varchar2(30),
 receipt_no varchar2��30),
 currency varchar2(30),
 message varchar2(30),
 verification_fee varchar2(30),
 machine_number varchar2(4000) not null,
 creation_date date default sysdate not null,
 created_by number default -1 not null,
 last_updated_by number default -1 not null,
 last_update_date date default sysdate not null
);
comment on table hls_payment_verification is '�տ���������';

comment on column hls_payment_verification.verification_id is '������';
comment on column hls_payment_verification.verification_no is '�������';
comment on column hls_payment_verification.contract_no is '���ݺ�ͬ���';
comment on column hls_payment_verification.creditor_project is 'ծȨ��(ˮ���)';
comment on column hls_payment_verification.verification_date is '��������';
comment on column hls_payment_verification.source_type is '��Դ����(��ס��Ա)';
comment on column hls_payment_verification.source_object is '��Դ����(��ס��Ա��Ϣ)';
comment on column hls_payment_verification.receipt_no is '��Դ����(�տ�������)';
comment on column hls_payment_verification.currency is '����';
comment on column hls_payment_verification.message is '��ע';
comment on column hls_payment_verification.verification_fee is '�������';
comment on column hls_payment_verification.creation_date is '��������';
comment on column hls_payment_verification.created_by is '������';
comment on column hls_payment_verification.last_updated_by is '����޸���';
comment on column hls_payment_verification.last_update_date is '����޸�����';

-- create/recreate primary, unique and foreign key constraints 
alter table hls_payment_verification
  add constraint hls_payment_verification_pk primary key (verification_id);
create index hls_payment_verification_n1 on hls_payment_verification(verification_id,verification_no);
spool off
exit
