CLASS zcl_cct_generate_testcase DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cct_generate_testcase IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA itab_testtype TYPE TABLE OF zcct_testtype.
    DATA itab_result TYPE TABLE OF zcct_testresult.

*   fill internal testtype table (itab)
    itab_testtype = VALUE #(
        ( testtypeid = '1' testtypename = 'PCR-Test' )
        ( testtypeid = '2' testtypename = 'Antikörpertest' )
        ( testtypeid = '3' testtypename = 'Antigentest' )
        ).

*   fill internal testresult table (itab)
    itab_result = VALUE #(
        ( testresultid = 'A' testresultname = 'ausstehend' )
        ( testresultid = 'P' testresultname = 'positiv' )
        ( testresultid = 'N' testresultname = 'negativ' )
        ).

*   delete existing entries in the database table
    DELETE FROM zcct_testtype.
    DELETE FROM zcct_testresult.

*   insert the new table entries
    INSERT zcct_testtype FROM TABLE @itab_testtype.
    out->write( |{ sy-dbcnt } testtype entries inserted successfully!| ).

    INSERT zcct_testresult FROM TABLE @itab_result.
    out->write( |{ sy-dbcnt } testresult entries inserted successfully!| ).
  ENDMETHOD.

ENDCLASS.
