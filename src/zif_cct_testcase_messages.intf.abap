interface ZIF_CCT_TESTCASE_MESSAGES
  public .

    CONSTANTS: msgid TYPE symsgid VALUE 'ZCCT_TESTCASE_MESSAGES',
             BEGIN OF msgno,
               testtype_not_found TYPE symsgno VALUE '001',
             END OF msgno.

endinterface.
