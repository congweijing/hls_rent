create or replace package Hls_checkin is

  -- Author  : WWW
  -- Created : 2018/8/14 14:55:49
  -- Purpose : 租房系统入住过程管理
  procedure checkin(p_staff_no        varchar2,
                    h_contract_number varchar2,
                    p_room_id         number,
                    p_leaving_date    date);
end Hls_checkin;
/
create or replace package body Hls_checkin is
  procedure checkin(p_staff_no        varchar2,
                    h_contract_number varchar2,
                    p_room_id         number,
                    p_leaving_date    date) is
  begin
    update hls_hsm
       set people_status   = 'type2',
           contract_no     = h_contract_number,
           leaving_date    = p_leaving_date,
           live_start_date = sysdate
     where staff_no = p_staff_no;
  
    update hls_room_info
       set bed_used = bed_used + 1, bed_free = bed_free - 1
     where room_id = p_room_id;
  
  end;
end Hls_checkin;
/
