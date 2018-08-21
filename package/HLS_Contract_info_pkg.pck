create or replace package HLS_Contract_info_pkg is

  -- Author  : WWW
  -- Created : 2018/8/8 18:51:12
  -- Purpose : 

  procedure insert_contract_info(p_contract_start_date  date,
                                 p_contract_finish_date date,
                                 p_room_id              number,
                                 
                                 p_month_rent_price     number,
                                 p_tenancy_term         number,
                                 p_agency_fee           number,
                                 p_Contract_invoice_tax number,
                                 p_sum_price            number,
                                 
                                 p_remark          varchar2,
                                 p_contract_remark varchar2);
    procedure update_contract_info(p_h_contract_number  varchar2,
                                 p_contract_start_date  date,
                                 p_contract_finish_date date,
                                 p_room_id              number,
                                 p_month_rent_price     number,
                                 p_tenancy_term         number,
                                 p_agency_fee           number,
                                 p_Contract_invoice_tax number,
                                 p_sum_price            number,
                                 p_currency             varchar2,
                                 p_remark               varchar2,
                                 p_contract_remark      varchar2) ;
  procedure modifi_contract_condition(p_h_contract_number varchar2);

end HLS_Contract_info_pkg;
/
create or replace package body HLS_Contract_info_pkg is

  -- Function and procedure implementations
  procedure insert_contract_info(p_contract_start_date  date,
                                 p_contract_finish_date date,
                                 p_room_id              number,
                                 p_month_rent_price     number,
                                 p_tenancy_term         number,
                                 p_agency_fee           number,
                                 p_Contract_invoice_tax number,
                                 p_sum_price            number,
                                 p_remark               varchar2,
                                 p_contract_remark      varchar2) is
    v_contract_ID       number;
    v_h_contract_number varchar2(100);
  
  begin
    v_contract_ID       := HLS_Contract_info_s.Nextval;
    v_h_contract_number := 'FWHT' || to_char(sysdate, 'yyyymm') ||
                           trim(to_char(1000 + HLS_Contract_info_s1.Nextval));
    insert into HLS_Contract_info
      (contract_ID,
       h_contract_number,
       contract_start_date,
       contract_finish_date,
       room_id,
       contract_condition,
       month_rent_price,
       tenancy_term,
       agency_fee,
       Contract_invoice_tax,
       sum_price,
       currency,
       remark,
       contract_remark,
       CREATION_DATE,
       created_by,
       last_updated_by,
       last_update_date)
    values
      (v_contract_ID,
       v_h_contract_number,
       p_contract_start_date,
       p_contract_finish_date,
       p_room_id,
       'type1',
       p_month_rent_price,
       p_tenancy_term,
       p_agency_fee,
       p_contract_invoice_tax,
       p_sum_price,
       '»À√Ò±“',
       p_remark,
       p_contract_remark,
       sysdate,
       1,
       -1,
       sysdate);
  end;
  procedure update_contract_info(p_h_contract_number  varchar2,
                                 p_contract_start_date  date,
                                 p_contract_finish_date date,
                                 p_room_id              number,
                                 p_month_rent_price     number,
                                 p_tenancy_term         number,
                                 p_agency_fee           number,
                                 p_Contract_invoice_tax number,
                                 p_sum_price            number,
                                 p_currency             varchar2,
                                 p_remark               varchar2,
                                 p_contract_remark      varchar2) is
  
  begin
  
    update HLS_Contract_info
       set contract_start_date  = p_contract_start_date,
           contract_finish_date = p_contract_finish_date,
           room_id              = p_room_id,
           month_rent_price     = p_month_rent_price,
           tenancy_term         = p_tenancy_term,
           agency_fee           = p_agency_fee,
           Contract_invoice_tax = p_Contract_invoice_tax,
           sum_price            = p_sum_price,
           currency             = p_currency,
           remark               = p_remark,
           contract_remark      = p_contract_remark,
           created_by           = 1,
           last_updated_by      = -1,
           last_update_date     = sysdate
      where h_contract_number = p_h_contract_number;
  
  end;
  
  procedure modifi_contract_condition(p_h_contract_number varchar2) is
  begin
    update HLS_Contract_info
       set contract_condition = 'type2'
     where h_contract_number = p_h_contract_number;
  end;
end HLS_Contract_info_pkg;
/
