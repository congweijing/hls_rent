create or replace package hls_rent_pkg is

  -- Author  : CONGWEIJING
  -- Created : 2018/8/8 14:11:50
  -- Purpose : 
  type ref_cursor is ref cursor;

  procedure insert_room_info(p_room_type          in varchar2,
                             p_room_area          varchar2,
                             p_bed_free           varchar2,
                             p_landlord_name      varchar2,
                             p_landlord_tel       varchar2,
                             p_room_addr_country  varchar2,
                             p_room_addr_province varchar2,
                             p_room_addr_city     varchar2,
                             p_room_abbr          varchar2,
                             p_intermediary       varchar2,
                             p_intermediary_name  varchar2,
                             p_intermediary_tel   varchar2,
                             p_message            varchar2);
  --���ñ����
  procedure insert_rent_fee_info(p_fee_no         varchar2,
                                 p_fee_add_date   date,
                                 p_fee_first_date date,
                                 p_fee_last_date  date,
                                 p_fee_items      varchar2,
                                 p_fee_sources    varchar2,
                                 p_fee_objects    varchar2,
                                 p_fee_amounts    number,
                                 p_fee_currency   varchar2,
                                 p_message        varchar2);
  /*--������ϸ�����
  procedure insert_rent_fee_detail(p_room_id        in varchar2,
                                   p_fee_items      in varchar2,
                                   p_fee_amounts    in number,
                                   p_fee_first_date in date,
                                   p_fee_last_date  in date);*/

  --���ݷ��ݱ�Ÿ��·�����Ϣ
  procedure update_room_info(p_room_no            in varchar2,
                             p_room_type          in varchar2,
                             p_room_area          varchar2,
                             p_bed                varchar2,
                             p_landlord_name      varchar2,
                             p_landlord_tel       varchar2,
                             p_room_addr_country  varchar2,
                             p_room_addr_province varchar2,
                             p_room_addr_city     varchar2,
                             p_room_abbr          varchar2,
                             p_intermediary       varchar2,
                             p_intermediary_name  varchar2,
                             p_intermediary_tel   varchar2,
                             p_message            varchar2);
  --����һ���ֹ��տ�����                       
  procedure insert_receipt_fee(p_receipt_objects in varchar2,
                               p_receipt_date    date,
                               p_receipt_ways    varchar2,
                               p_receipt_sources varchar2,
                               p_receipt_amounts varchar2,
                               p_currency        varchar2,
                               p_message         varchar2);

  --������Ա��Ϣ                            
  procedure insert_people_info(
                               /*   p_personnel_no in varchar2,*/p_staff_no     in varchar2,
                               p_name         in varchar2,
                               p_gender       in varchar2,
                               p_department   in varchar2,
                               p_base_in      in varchar2,
                               p_phone_number in varchar2,
                               p_email        in varchar2,
                               p_message      in varchar2);
  --������Ա��Ÿ�����Ա��Ϣ 
  procedure update_people_info(p_personnel_no in varchar2,
                               p_staff_no     in varchar2,
                               p_name         in varchar2,
                               p_gender       in varchar2,
                               p_department   in varchar2,
                               p_base_in      in varchar2,
                               p_phone_number in varchar2,
                               p_email        in varchar2,
                               p_message      in varchar2);
  --������ϸ��                               
  procedure insert_fee_detail_by_staffno(p_room_id        in varchar2,
                                         p_fee_items      in varchar2,
                                         p_fee_amounts    in number,
                                         p_fee_first_date in date,
                                         p_fee_last_date  in date);
  --�ֹ������ύ
  procedure verification_insert_update(p_contract_no           varchar2,
                                       p_receipt_no            varchar2,
                                       p_staff_no              varchar2,
                                       p_verification_rental   number,
                                       p_verification_water    number,
                                       p_verification_electric number,
                                       p_verification_network  number,
                                       p_verification_cable    number,
                                       p_receipt_sources       varchar2,
                                       p_message               varchar2);
  --������������
  procedure insert_payment_verification(v_verification_id   number,
                                        v_verification_no   varchar2,
                                        v_contract_no       varchar2,
                                        v_creditor_project  varchar2,
                                        v_verification_date varchar2,
                                        v_source_type       varchar2,
                                        v_source_object     varchar2,
                                        v_receipt_no        varchar2,
                                        v_currency          varchar2,
                                        v_message           varchar2,
                                        v_verification_fee  number);
end hls_rent_pkg;
/
create or replace package body hls_rent_pkg is
  procedure insert_room_info(p_room_type          in varchar2,
                             p_room_area          varchar2,
                             p_bed_free           varchar2,
                             p_landlord_name      varchar2,
                             p_landlord_tel       varchar2,
                             p_room_addr_country  varchar2,
                             p_room_addr_province varchar2,
                             p_room_addr_city     varchar2,
                             p_room_abbr          varchar2,
                             p_intermediary       varchar2,
                             p_intermediary_name  varchar2,
                             p_intermediary_tel   varchar2,
                             p_message            varchar2) is
    v_room_id number := hls_room_info_s.nextval;
    v_room_no varchar2(30);
  begin
    select 'FW' || to_char(sysdate, 'YYYYmmdd') ||
           trim(to_char((1000 + hls_room_info_s1.nextval)))
      into v_room_no
      from dual;
    insert into hls_room_info
      (room_id,
       room_no,
       room_abbr,
       room_type,
       room_area,
       bed,
       bed_used,
       bed_free,
       landlord_name,
       landlord_tel,
       intermediary,
       intermediary_name,
       intermediary_tel,
       message,
       room_addr_country,
       room_addr_province,
       room_addr_city,
       room_status,
       creation_date,
       created_by,
       last_updated_by,
       last_update_date)
    values
      (v_room_id,
       v_room_no,
       p_room_abbr,
       p_room_type,
       p_room_area,
       p_bed_free,
       0,
       p_bed_free,
       p_landlord_name,
       p_landlord_tel,
       p_intermediary,
       p_intermediary_name,
       p_intermediary_tel,
       p_message,
       p_room_addr_country,
       p_room_addr_province,
       p_room_addr_city,
       'status1',
       sysdate,
       1,
       -1,
       sysdate);
  end insert_room_info;
  --���õ�����
  procedure insert_rent_fee_info(p_fee_no         varchar2,
                                 p_fee_add_date   date,
                                 p_fee_first_date date,
                                 p_fee_last_date  date,
                                 p_fee_items      varchar2,
                                 p_fee_sources    varchar2,
                                 p_fee_objects    varchar2,
                                 p_fee_amounts    number,
                                 p_fee_currency   varchar2,
                                 p_message        varchar2) is
    v_fee_id hls_rent_fee_info.fee_id%type := hls_rent_fee_info_s.nextval;
    v_fee_no hls_rent_fee_info.fee_no%type := 'FYD' ||
                                              to_char(sysdate, 'yyyymmdd') ||
                                              trim(to_char(1000 + v_fee_id));
  
  begin
  
    insert into hls_rent_fee_info
      (fee_id,
       fee_no,
       fee_add_date,
       fee_first_date,
       fee_last_date,
       fee_items,
       fee_sources,
       fee_objects,
       fee_amounts,
       fee_currency,
       message,
       created_by,
       creation_date,
       last_updated_by,
       last_update_date)
    values
      (v_fee_id,
       v_fee_no,
       p_fee_add_date,
       p_fee_first_date,
       p_fee_last_date,
       p_fee_items,
       p_fee_sources,
       p_fee_objects,
       p_fee_amounts,
       p_fee_currency,
       p_message,
       1,
       sysdate,
       -1,
       sysdate);
    insert_fee_detail_by_staffno(p_fee_objects,
                                 p_fee_items,
                                 p_fee_amounts,
                                 p_fee_first_date,
                                 p_fee_last_date);
  end insert_rent_fee_info;
  /*--��������һ���շѷ�����������ϸ
  procedure insert_rent_fee_detail(p_room_id        in varchar2,
                                   p_fee_items      in varchar2,
                                   p_fee_amounts    in number,
                                   p_fee_first_date in date,
                                   p_fee_last_date  in date) is
    v_every_date     date := p_fee_first_date;
    v_fee_detail_id  number;
    v_contract_no    varchar2(30);
    v_count          number;
    v_room_price     number;
    v_water_price    number;
    v_electric_price number;
    v_network_price  number;
    v_cable_price    number;
    v_fee_period     number := 1;
    cursor fee_cursor is
      select hfi.fee_no         fee_no,
             hfi.fee_first_date fee_first_date,
             hfi.fee_last_date  fee_last_date,
             hfi.fee_items      fee_items,
             hfi.fee_objects    fee_objects,
             hfi.fee_amounts    fee_amounts
        from hls_rent_fee_info hfi;
  
  begin
    select hls_contract_info.contract_id
      into v_contract_no
      from hls_contract_info
     where hls_contract_info.room_id = p_room_id;
    for i_cursor in fee_cursor loop
      --�ж�������
      \* ����ķ���������ԭ���ڵķ������һ�������жԱȣ�
        ���֮ǰ���ڴ˷�����Ҹ�����ö���ȡһ�����ж��˴�
      Ϊ�����շ�*\
      --�������ͬ���շ���Ŀ��֮ǰ������Ŀ��ͬ��
      if i_cursor.fee_objects = p_room_id and
         i_cursor.fee_items = p_fee_items then
        v_fee_period := v_fee_period + 1;
        \* else 
        v_fee_period := 1;*\
      end if;
    end loop;
  
    --�ӷ��ÿ�ʼ��+1ѭ�������ý����գ�����room_id������Ա����סʱ������һ����ס������
    while v_every_date < p_fee_last_date loop
      select count(hh.staff_no)
        into v_count
        from hls_hsm hh, hls_contract_info hci
       where hh.contract_no = hci.h_contract_number
         and hci.room_id = p_room_id
         and v_every_date between hh.live_start_date and hh.check_out_date;
      --���ݺ�ͬ�ż���һ����ס��������̯�����
      select round((hci1.sum_price /
                   (hci1.contract_finish_date - hci1.contract_start_date)) /
                   v_count,
                   2)
        into v_room_price
        from hls_hsm hh1, hls_contract_info hci1
       where hh1.contract_no = hci1.h_contract_number
         and hci1.room_id = p_room_id;
      --ͬ�������һ��ĸ������
      --����ˮ��
      if p_fee_items = 'fee_items_1' then
        select round((p_fee_amounts / (p_fee_last_date - p_fee_first_date)) /
                     v_count,
                     2)
          into v_water_price
          from dual;
      end if;
      --������
      if p_fee_items = 'fee_items_2' then
        select round((p_fee_amounts / (p_fee_last_date - p_fee_first_date)) /
                     v_count,
                     2)
          into v_electric_price
          from dual;
      end if;
      --�����������
      if p_fee_items = 'fee_items_3' then
        select round((p_fee_amounts / (p_fee_last_date - p_fee_first_date)) /
                     v_count,
                     2)
          into v_network_price
          from dual;
      end if;
      --�������ߵ��ӷ���
      if p_fee_items = 'fee_items_4' then
        select round((p_fee_amounts / (p_fee_last_date - p_fee_first_date)) /
                     v_count,
                     2)
          into v_cable_price
          from dual;
      end if;
      v_fee_detail_id := hls_fee_detail_s.nextval;
      --���һ�ڱ�ķ������ݹ���
      insert into hls_fee_detail
        (fee_detail_id,
         starff_no,
         periods,
         apportion_rental,
         apportion_water,
         apportion_electric,
         apportion_network,
         apportion_cable)
      values
        (v_fee_detail_id,
         v_contract_no,
         v_fee_period,
         v_room_price,
         v_water_price,
         v_electric_price,
         v_network_price,
         v_cable_price);
      v_every_date := v_every_date + 1;
    end loop;
  end insert_rent_fee_detail;*/

  --���ݷ��ݱ�Ÿ��·�����Ϣ
  procedure update_room_info(p_room_no            in varchar2,
                             p_room_type          in varchar2,
                             p_room_area          varchar2,
                             p_bed                varchar2,
                             p_landlord_name      varchar2,
                             p_landlord_tel       varchar2,
                             p_room_addr_country  varchar2,
                             p_room_addr_province varchar2,
                             p_room_addr_city     varchar2,
                             p_room_abbr          varchar2,
                             p_intermediary       varchar2,
                             p_intermediary_name  varchar2,
                             p_intermediary_tel   varchar2,
                             p_message            varchar2) is
    v_room_type          varchar2(200) := p_room_type;
    v_room_area          varchar2(200) := p_room_area;
    v_bed                varchar2(200) := p_bed;
    v_room_addr_country  varchar2(200) := p_room_addr_country;
    v_room_addr_province varchar2(200) := p_room_addr_province;
    v_room_addr_city     varchar2(200) := p_room_addr_city;
  begin
    if (v_room_type is null or v_room_type = '') then
      select h.room_type
        into v_room_type
        from hls_room_info h
       where h.room_no = p_room_no;
    end if;
    if (v_room_area is null or v_room_area = '') then
      select h.room_area
        into v_room_area
        from hls_room_info h
       where h.room_no = p_room_no;
    end if;
    if (v_bed is null or v_bed = '') then
      select h.bed
        into v_bed
        from hls_room_info h
       where h.room_no = p_room_no;
    end if;
    if (v_room_addr_country is null or v_room_addr_country = '') then
      select h.room_addr_country
        into v_room_addr_country
        from hls_room_info h
       where h.room_no = p_room_no;
    end if;
    if (v_room_addr_province is null or v_room_addr_province = '') then
      select h.room_addr_province
        into v_room_addr_province
        from hls_room_info h
       where h.room_no = p_room_no;
    end if;
    if (v_room_addr_city is null or v_room_addr_city = '') then
      select h.room_addr_city
        into v_room_addr_city
        from hls_room_info h
       where h.room_no = p_room_no;
    end if;
    update hls_room_info
       set room_abbr          = p_room_abbr,
           room_type          = v_room_type,
           room_area          = v_room_area,
           bed                = v_bed,
           landlord_name      = p_landlord_name,
           landlord_tel       = p_landlord_tel,
           intermediary       = p_intermediary,
           intermediary_name  = p_intermediary_name,
           intermediary_tel   = p_intermediary_tel,
           message            = p_message,
           room_addr_country  = v_room_addr_country,
           room_addr_province = v_room_addr_province,
           room_addr_city     = v_room_addr_city,
           last_update_date   = sysdate
     where room_no = p_room_no;
  end;

  --����һ���ֹ��տ�����
  procedure insert_receipt_fee(p_receipt_objects in varchar2,
                               
                               p_receipt_date    date,
                               p_receipt_ways    varchar2,
                               p_receipt_sources varchar2,
                               p_receipt_amounts varchar2,
                               p_currency        varchar2,
                               p_message         varchar2) is
    v_receipt_id  number := hls_rent_receipt_fee_s.nextval;
    v_receipt_no  varchar2(30);
    v_contract_no varchar2(30); --����Ա����Ų��Һ�ͬ���
    v_count       number;
  begin
    select 'SKXZ' || to_char(sysdate, 'YYYYmmdd') ||
           trim(to_char((1000 + hls_rent_receipt_fee_s1.nextval)))
      into v_receipt_no
      from dual;
    select contract_no
      into v_contract_no
      from hls_hsm
     where staff_no = p_receipt_objects;
    if p_receipt_sources = 'room_people' then
    
      select count(1)
        into v_count
        from hls_rent_receipt_fee hrf
       where hrf.receipt_objects = p_receipt_objects;
      if v_count != 0 then
        update hls_rent_receipt_fee hrf
           set hrf.receipt_amounts = hrf.receipt_amounts + p_receipt_amounts
         where hrf.receipt_objects = p_receipt_objects;
      else
        insert into hls_rent_receipt_fee
          (receipt_id,
           receipt_no,
           receipt_sources,
           receipt_objects,
           receipt_ways,
           receipt_date,
           receipt_amounts,
           currency,
           contract_no,
           message,
           creation_date,
           created_by,
           last_updated_by,
           last_update_date)
        values
          (v_receipt_id,
           v_receipt_no,
           p_receipt_sources,
           p_receipt_objects,
           p_receipt_ways,
           p_receipt_date,
           p_receipt_amounts,
           p_currency,
           v_contract_no,
           p_message,
           sysdate,
           1,
           -1,
           sysdate);
      end if;
    else
      insert into hls_rent_receipt_fee
        (receipt_id,
         receipt_no,
         receipt_sources,
         receipt_objects,
         receipt_ways,
         receipt_date,
         receipt_amounts,
         currency,
         contract_no,
         message,
         creation_date,
         created_by,
         last_updated_by,
         last_update_date)
      values
        (v_receipt_id,
         v_receipt_no,
         'others',
         '',
         p_receipt_ways,
         p_receipt_date,
         p_receipt_amounts,
         p_currency,
         v_contract_no,
         p_message,
         sysdate,
         1,
         -1,
         sysdate);
    end if;
  end insert_receipt_fee;
  --������Ա��Ϣ
  procedure insert_people_info(
                               /*   p_personnel_no in varchar2,*/p_staff_no     in varchar2,
                               p_name         in varchar2,
                               p_gender       in varchar2,
                               p_department   in varchar2,
                               p_base_in      in varchar2,
                               p_phone_number in varchar2,
                               p_email        in varchar2,
                               p_message      in varchar2) is
    v_people_id    number := hls_people_info_s.nextval;
    v_personnel_no varchar2(30);
  
  begin
    select 'RZRY' || to_char(sysdate, 'YYYYMM') ||
           trim(to_char((1000 + hls_people_info_s1.nextval)))
      into v_personnel_no
      from dual;
  
    insert into hls_hsm
    
      (people_id,
       personnel_no,
       staff_no,
       name,
       gender,
       department,
       base_in,
       phone_number,
       people_status,
       email,
       message,
       leaving_date,
       live_start_date,
       created_by,
       creation_date,
       last_updated_by,
       last_update_date)
    values
      (v_people_id,
       v_personnel_no,
       p_staff_no,
       p_name,
       p_gender,
       p_department,
       p_base_in,
       p_phone_number,
       'type1',
       p_email,
       p_message,
       sysdate,
       sysdate,
       1,
       sysdate,
       -1,
       sysdate);
  end;

  --������Ա��Ÿ�����Ա��Ϣ   
  procedure update_people_info(p_personnel_no in varchar2,
                               p_staff_no     in varchar2,
                               p_name         in varchar2,
                               p_gender       in varchar2,
                               p_department   in varchar2,
                               p_base_in      in varchar2,
                               p_phone_number in varchar2,
                               p_email        in varchar2,
                               p_message      in varchar2) is
    v_gender     varchar2(30) := p_gender;
    v_department varchar2(30) := p_department;
    v_base_in    varchar2(30) := p_base_in;
  begin
    if (v_gender is null or v_gender = '') then
      select h.gender
        into v_gender
        from hls_hsm h
       where h.personnel_no = p_personnel_no;
    end if;
    if (v_department is null or v_department = '') then
      select h.department
        into v_department
        from hls_hsm h
       where h.personnel_no = p_personnel_no;
    end if;
    if (v_base_in is null or v_base_in = '') then
      select h.base_in
        into v_base_in
        from hls_hsm h
       where h.personnel_no = p_personnel_no;
    end if;
    update hls_hsm
       set staff_no         = p_staff_no,
           name             = p_name,
           gender           = v_gender,
           department       = v_department,
           base_in          = v_base_in,
           phone_number     = p_phone_number,
           email            = p_email,
           message          = p_message,
           last_update_date = sysdate
     where personnel_no = p_personnel_no;
  end;
  procedure insert_fee_detail_by_staffno(p_room_id        in varchar2,
                                         p_fee_items      in varchar2,
                                         p_fee_amounts    in number,
                                         p_fee_first_date in date,
                                         p_fee_last_date  in date) is
    v_every_date     date := p_fee_first_date;
    v_fee_detail_id  number;
    v_starff_no      varchar2(30);
    v_count          number;
    v_room_price     number;
    v_water_price    number;
    v_electric_price number;
    v_network_price  number;
    v_cable_price    number;
    v_fee_period     number := 1;
    type staff_type is table of hls_hsm.staff_no%type index by binary_integer;
    v_staff_table staff_type;
  
    cursor fee_cursor is
      select hfi.fee_no         fee_no,
             hfi.fee_first_date fee_first_date,
             hfi.fee_last_date  fee_last_date,
             hfi.fee_items      fee_items,
             hfi.fee_objects    fee_objects,
             hfi.fee_amounts    fee_amounts
        from hls_rent_fee_info hfi;
  begin
    for i_cursor in fee_cursor loop
      if (i_cursor.fee_items != null or i_cursor.fee_items != '') and
         (i_cursor.fee_objects != null or i_cursor.fee_items != '') then
        if i_cursor.fee_items = p_fee_items and
           i_cursor.fee_objects = p_room_id then
          v_fee_period := v_fee_period + 1;
        end if;
      end if;
    end loop;
    while v_every_date <= p_fee_last_date loop
    
      select count(hh.staff_no)
        into v_count
        from hls_hsm hh, hls_contract_info hci
       where hh.contract_no = hci.h_contract_number
         and hci.room_id = p_room_id
         and v_every_date between hh.live_start_date and
             nvl(hh.check_out_date, date '2099-01-01');
      --�õ���һ��ס�ڸ÷����ÿһԱ����Ա����      
      if v_count > 0 then
        for i in 1 .. v_count loop
          select staff_no
            into v_staff_table(i)
            from (select hh.staff_no
                    from hls_hsm hh, hls_contract_info hci
                   where hh.contract_no = hci.h_contract_number
                     and hci.room_id = p_room_id
                     and (v_every_date between hh.live_start_date and
                         nvl(hh.check_out_date, date '2099-01-01'))
                     and rownum <= i)
          minus (select hh.staff_no
                   from hls_hsm hh, hls_contract_info hci
                  where hh.contract_no = hci.h_contract_number
                    and hci.room_id = p_room_id
                    and (v_every_date between hh.live_start_date and
                        nvl(hh.check_out_date, date '2099-01-01'))
                    and rownum <= i - 1);
        end loop;
        --����Ա�����Լ��շ���Ŀ�����շ���ϸ������ݲ���(ÿλԱ������������ƽ̯������)
        for i in 1 .. v_count loop
          /*����������ƽ̯������������ǰ��ܽ����Ժ�ͬ��Ч�����գ����������̶�
          ����������ͬ�Ķ������ݣ���ȡrownum=1��
          ������ͬƽ̯��һ����ȡrownum=1���������������������ƽ̯*/
          select round((hci1.sum_price / (hci1.contract_finish_date -
                       hci1.contract_start_date)) / v_count,
                       2)
            into v_room_price
            from hls_hsm hh1, hls_contract_info hci1
           where hh1.contract_no = hci1.h_contract_number
             and hci1.room_id = p_room_id
             and rownum <= 1;
          --ͬ�������һ��ĸ������
          --����ˮ��
          if p_fee_items = 'fee_items_1' then
            select round((p_fee_amounts /
                         (p_fee_last_date - p_fee_first_date)) / v_count,
                         2)
              into v_water_price
              from dual;
          end if;
          --������
          if p_fee_items = 'fee_items_2' then
            select round((p_fee_amounts /
                         (p_fee_last_date - p_fee_first_date)) / v_count,
                         2)
              into v_electric_price
              from dual;
          end if;
          --�����������
          if p_fee_items = 'fee_items_3' then
            select round((p_fee_amounts /
                         (p_fee_last_date - p_fee_first_date)) / v_count,
                         2)
              into v_network_price
              from dual;
          end if;
          --�������ߵ��ӷ���
          if p_fee_items = 'fee_items_4' then
            select round((p_fee_amounts /
                         (p_fee_last_date - p_fee_first_date)) / v_count,
                         2)
              into v_cable_price
              from dual;
          end if;
          v_fee_detail_id := hls_fee_detail_s.nextval;
          /*          ���ڽ��컹��ס�޵�Ա����˵�������ƽ̯�ķ��ü��ɲ�����ϸ��
          ������ס��ͬһ�����ÿλԱ�� */
          insert into hls_fee_detail
            (fee_detail_id,
             staff_no,
             periods,
             apportion_rental,
             apportion_water,
             apportion_electric,
             apportion_network,
             apportion_cable)
          values
            (v_fee_detail_id,
             v_staff_table(i),
             v_fee_period,
             v_room_price,
             v_water_price,
             v_electric_price,
             v_network_price,
             v_cable_price);
        end loop;
      end if;
      v_every_date := v_every_date + 1;
    end loop;
  end insert_fee_detail_by_staffno;
  --�ֹ������ύ
  procedure verification_insert_update(p_contract_no           varchar2,
                                       p_receipt_no            varchar2,
                                       p_staff_no              varchar2,
                                       p_verification_rental   number,
                                       p_verification_water    number,
                                       p_verification_electric number,
                                       p_verification_network  number,
                                       p_verification_cable    number,
                                       p_receipt_sources       varchar2,
                                       p_message               varchar2) is
    cursor verification_cursor is
      select hpv.creditor_project creditor_project,
             hpv.source_type      source_type,
             hpv.receipt_no       receipt_no,
             hpv.source_object    source_object,
             hpv.verification_fee verification_fee
        from hls_payment_verification hpv
       where hpv.contract_no = p_contract_no;
    v_update_insert   varchar2(30) := 'insert';
    v_verification_no varchar2(30);
    v_number_contract          number;
    v_number_staff number;
  begin
  
    select 'SKHX' || to_char(sysdate, 'yyyymmdd') ||
           trim(to_char(1000 + hls_payment_verification_s.nextval))
      into v_verification_no
      from dual;
    --�����ͬ���ڣ��α겻Ϊ�գ������Ա���Ÿ�������
    --����ú�ͬ�µ�Ա�����ڣ������
    --�����ڣ������
    select count(1)
      into v_number_contract
      from hls_payment_verification hpv
     where hpv.contract_no = p_contract_no;
    if v_number_contract != 0 then
       select count(1)
         into v_number_staff
         from hls_payment_verification hpv
        where hpv.source_object = p_staff_no;
      
        --���
        if v_number_staff != 0 then
          --���ڼ����£�
        
          update hls_payment_verification hpv
             set hpv.verification_fee = p_verification_rental +
                                        hpv.verification_fee
           where hpv.source_object = p_staff_no
             and hpv.creditor_project = '���';
        
          --ˮ
        
          update hls_payment_verification hpv
             set hpv.verification_fee = p_verification_water +
                                        hpv.verification_fee
           where hpv.source_object = p_staff_no
             and hpv.creditor_project = 'fee_items_1';
        
          --��
        
          update hls_payment_verification hpv
             set hpv.verification_fee = p_verification_electric +
                                        hpv.verification_fee
           where hpv.source_object = p_staff_no
             and hpv.creditor_project = 'fee_items_2';
        
          --����
        
          update hls_payment_verification hpv
             set hpv.verification_fee = p_verification_rental +
                                        hpv.verification_fee
           where hpv.source_object = p_staff_no
             and hpv.creditor_project = 'fee_items_3';
        
          --����
        
          update hls_payment_verification hpv
             set hpv.verification_fee = p_verification_rental +
                                        hpv.verification_fee
           where hpv.source_object = p_staff_no
             and hpv.creditor_project = 'fee_items_4';
        else      
          --���
        
          insert_payment_verification(hls_payment_verification_s.nextval,
                                      v_verification_no,
                                      p_contract_no,
                                      '���',
                                      sysdate,
                                      p_receipt_sources,
                                      p_staff_no,
                                      p_receipt_no,
                                      'CNY',
                                      p_message,
                                      p_verification_rental);
        
          --ˮ
        
          insert_payment_verification(hls_payment_verification_s.nextval,
                                      v_verification_no,
                                      p_contract_no,
                                      'fee_items_1',
                                      sysdate,
                                      p_receipt_sources,
                                      p_staff_no,
                                      p_receipt_no,
                                      'CNY',
                                      p_message,
                                      p_verification_water);
        
          --��
        
          insert_payment_verification(hls_payment_verification_s.nextval,
                                      v_verification_no,
                                      p_contract_no,
                                      'fee_items_2',
                                      sysdate,
                                      p_receipt_sources,
                                      p_staff_no,
                                      p_receipt_no,
                                      'CNY',
                                      p_message,
                                      p_verification_electric);
        
          --����
        
          insert_payment_verification(hls_payment_verification_s.nextval,
                                      v_verification_no,
                                      p_contract_no,
                                      'fee_items_3',
                                      sysdate,
                                      p_receipt_sources,
                                      p_staff_no,
                                      p_receipt_no,
                                      'CNY',
                                      p_message,
                                      p_verification_network);
        
          --����
        
          insert_payment_verification(hls_payment_verification_s.nextval,
                                      v_verification_no,
                                      p_contract_no,
                                      'fee_items_4',
                                      sysdate,
                                      p_receipt_sources,
                                      p_staff_no,
                                      p_receipt_no,
                                      'CNY',
                                      p_message,
                                      p_verification_cable);
        
        end if;
      ------------------------
    else
      --���
      insert_payment_verification(hls_payment_verification_s.nextval,
                                  v_verification_no,
                                  p_contract_no,
                                  '���',
                                  sysdate,
                                  p_receipt_sources,
                                  p_staff_no,
                                  p_receipt_no,
                                  'CNY',
                                  p_message,
                                  p_verification_rental);
    
      --ˮ
    
      insert_payment_verification(hls_payment_verification_s.nextval,
                                  v_verification_no,
                                  p_contract_no,
                                  'fee_items_1',
                                  sysdate,
                                  p_receipt_sources,
                                  p_staff_no,
                                  p_receipt_no,
                                  'CNY',
                                  p_message,
                                  p_verification_water);
    
      --��
    
      insert_payment_verification(hls_payment_verification_s.nextval,
                                  v_verification_no,
                                  p_contract_no,
                                  'fee_items_2',
                                  sysdate,
                                  p_receipt_sources,
                                  p_staff_no,
                                  p_receipt_no,
                                  'CNY',
                                  p_message,
                                  p_verification_electric);
    
      --����
    
      insert_payment_verification(hls_payment_verification_s.nextval,
                                  v_verification_no,
                                  p_contract_no,
                                  'fee_items_3',
                                  sysdate,
                                  p_receipt_sources,
                                  p_staff_no,
                                  p_receipt_no,
                                  'CNY',
                                  p_message,
                                  p_verification_network);
    
      --����
    
      insert_payment_verification(hls_payment_verification_s.nextval,
                                  v_verification_no,
                                  p_contract_no,
                                  'fee_items_4',
                                  sysdate,
                                  p_receipt_sources,
                                  p_staff_no,
                                  p_receipt_no,
                                  'CNY',
                                  p_message,
                                  p_verification_cable);
    end if;
    --�����տ������
    update hls_rent_receipt_fee hrf
       set hrf.verification_amounts = nvl(p_verification_rental, 0) +
                                      nvl(p_verification_water, 0) +
                                      nvl(p_verification_electric, 0) +
                                      nvl(p_verification_network, 0) +
                                      nvl(p_verification_cable, 0) +
                                      nvl(hrf.verification_amounts, 0),
           hrf.verification_no      = v_verification_no
     where hrf.receipt_objects = p_staff_no;
  
  end verification_insert_update;
  --������������
  procedure insert_payment_verification(v_verification_id   number,
                                        v_verification_no   varchar2,
                                        v_contract_no       varchar2,
                                        v_creditor_project  varchar2,
                                        v_verification_date varchar2,
                                        v_source_type       varchar2,
                                        v_source_object     varchar2,
                                        v_receipt_no        varchar2,
                                        v_currency          varchar2,
                                        v_message           varchar2,
                                        v_verification_fee  number) is
  begin
    insert into hls_payment_verification
      (verification_id,
       verification_no,
       contract_no,
       creditor_project,
       verification_date,
       source_type,
       source_object,
       receipt_no,
       currency,
       message,
       verification_fee)
    values
      (v_verification_id,
       v_verification_no,
       v_contract_no,
       v_creditor_project,
       v_verification_date,
       v_source_type,
       v_source_object,
       v_receipt_no,
       v_currency,
       v_message,
       v_verification_fee);
  end insert_payment_verification;
end hls_rent_pkg;
/
