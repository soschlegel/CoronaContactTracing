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
             END OF msgno.

ENDINTERFACE.
