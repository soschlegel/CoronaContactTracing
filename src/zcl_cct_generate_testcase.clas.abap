CLASS zcl_cct_generate_testcase DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
protected section.
private section.
ENDCLASS.



CLASS ZCL_CCT_GENERATE_TESTCASE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA itab_testtype TYPE TABLE OF zcct_testtype.
    DATA itab_result TYPE TABLE OF zcct_testresult.
    DATA itab_testcase TYPE TABLE OF zcct_testcase.
    DATA itab_testperson TYPE TABLE OF zcct_testperson.
    DATA itab_employee TYPE TABLE OF zcct_healthdepem.


*   fill internal testtype table (itab)
    itab_testtype = VALUE #(
        ( testtypeid = '1' testtypename = 'PCR-Test' )
        ( testtypeid = '2' testtypename = 'Antikörpertest' )
        ( testtypeid = '3' testtypename = 'Antigentest' )
        ).

*   fill internal testresult table (itab)
    itab_result = VALUE #(
        ( testresultid = 'A' testresultname = 'Ausstehend' )
        ( testresultid = 'P' testresultname = 'Positiv' )
        ( testresultid = 'N' testresultname = 'Negativ' )
        ).

    itab_testcase = VALUE #(
        ( testid = '1' personid = '2' employeeid = '3' testtype = '1' testdate = '20201125' testtime = '162500' testresultdate = '20201126' testresulttime = '170000' testresult = 'A')
        ( testid = '2' personid = '3' employeeid = '3' testtype = '2' testdate = '20201125' testtime = '162500' testresultdate = '20201126' testresulttime = '170000' testresult = 'A')
        ( testid = '3' personid = '5' employeeid = '3' testtype = '3' testdate = '20201125' testtime = '162500' testresultdate = '20201126' testresulttime = '170000' testresult = 'A')
        ).

    itab_testperson = VALUE #(
    ( test_person_id = '2' firstname = 'Bella' lastname = 'Marina' )
    ( test_person_id = '3' firstname = 'Pizza' lastname = 'Pizza' )
    ( test_person_id = '5' firstname = 'Hans' lastname = 'von Glück' )
    ).

    itab_employee = VALUE #(
    ( emplyee_id = '3' firstname = 'Test' lastname = 'Tester' )
    ).

*   delete existing entries in the database table
    DELETE FROM zcct_testtype.
    DELETE FROM zcct_testresult.
    DELETE FROM zcct_testcase.
    DELETE FROM zcct_testperson.
    DELETE FROM zcct_healthdepem.

*   insert the new table entries
    INSERT zcct_testtype FROM TABLE @itab_testtype.
    out->write( |{ sy-dbcnt } testtype entries inserted successfully!| ).

    INSERT zcct_testresult FROM TABLE @itab_result.
    out->write( |{ sy-dbcnt } testresult entries inserted successfully!| ).

    INSERT zcct_testcase FROM TABLE @itab_testcase.
    out->write( |{ sy-dbcnt } testcase entries inserted successfully!| ).

    INSERT zcct_testperson FROM TABLE @itab_testperson.
    out->write( |{ sy-dbcnt } testperson entries inserted successfully!| ).

    INSERT zcct_healthdepem FROM TABLE @itab_employee.
    out->write( |{ sy-dbcnt } employee entries inserted successfully!| ).
  ENDMETHOD.
ENDCLASS.
