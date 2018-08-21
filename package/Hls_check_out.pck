create or replace package Hls_check_out is

  -- Author  : WWW
  -- Created : 2018/8/15 16:27:42
  -- Purpose : 

  procedure checkout(p_staff_no       varchar2,
                     p_room_id        number,
                     p_check_out_date date);

end Hls_check_out;
/
create or replace package body Hls_check_out is

  procedure checkout(p_staff_no       varchar2,
                     p_room_id        number,
                     p_check_out_date date) is
  begin
    update hls_hsm
       set people_status = 'type3',
           check_out_date = p_check_out_date
     where staff_no = p_staff_no;
  
    update hls_room_info
       set bed_used = bed_used - 1, bed_free = bed_free + 1
     where room_id = p_room_id;  
  end;
end Hls_check_out;
/
