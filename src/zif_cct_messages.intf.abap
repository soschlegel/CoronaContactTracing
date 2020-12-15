INTERFACE zif_cct_messages
  PUBLIC .

  CONSTANTS: msgid TYPE symsgid VALUE 'ZCCT_MESSAGES',
             BEGIN OF msgno,
               employee_not_found TYPE symsgno VALUE '001',
               testcase_not_found TYPE symsgno VALUE '002',
               county_not_found TYPE symsgno VALUE '003',
               county_already_assigned TYPE symsgno VALUE '004',
               name_is_empty TYPE symsgno VALUE '005',
               address_is_empty TYPE symsgno VALUE '006',
               casestatus_not_found TYPE symsgno VALUE '007',
               associated_casefile_not_valid TYPE symsgno VALUE '008',
               first_name_required TYPE symsgno VALUE '009',
               last_name_required TYPE symsgno VALUE '010',
               department_not_found TYPE symsgno VALUE '011',
               treatment_negative TYPE symsgno VALUE '012',
             END OF msgno.

ENDINTERFACE.
