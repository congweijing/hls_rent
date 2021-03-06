--房屋信息ID序列
create sequence hls_room_info_s
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;

--房屋信息编号序列
create sequence hls_room_info_s1
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;
--手工收款ID序列
create sequence hls_rent_receipt_fee_s
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;
--手工收款编号序列
create sequence hls_rent_receipt_fee_s1
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;

--入住人员ID序列
create sequence hls_people_info_s
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;
--入住人员编号序列
create sequence hls_people_info_s1
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;

--房屋合同ID序列
create sequence HLS_Contract_info_s
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;

--房屋合同编号序列
create sequence HLS_Contract_info_s1
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;

--费用序列
create sequence hls_rent_fee_info_s
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;
--费用明细序列
create sequence hls_fee_detail_s
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;

--核销序列
create sequence hls_payment_verification_s
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;



