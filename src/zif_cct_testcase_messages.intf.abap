INTERFACE zif_cct_testcase_messages
  PUBLIC .

  CONSTANTS:
    msgid TYPE symsgid VALUE 'ZCCT_TESTCASE_MESSAGES',

    BEGIN OF testtype_unknown,
      msgid TYPE symsgid VALUE 'Testart unbekannt',
      msgno TYPE symsgno VALUE '001',
      attr1 TYPE scx_attrname VALUE 'MV_CUSTOMER_ID',
      attr2 TYPE scx_attrname VALUE '',
      attr3 TYPE scx_attrname VALUE '',
      attr4 TYPE scx_attrname VALUE '',
    END OF testtype_unknown.

ENDINTERFACE.
