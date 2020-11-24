CLASS zcl_cct_test_person_filler DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_cct_test_person_filler IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA itab TYPE TABLE OF zcct_county.

*    itab = VALUE #(
*        ( healthdep_id = '739HBK64HF' name = 'NRW HD' county_id = '053HBK64HF' address = 'genau hier' leading_employee_id = 0 additional_description = 'no add. desc.' )
*     ).

*   fill internal persons table (itab)
    itab = VALUE #(
      ( countyuuid = '739HBK64HF' county_id = 0 federal_state_id = 0 countyname = 'nordrhein' )
      ( countyuuid = '736HDNL4HF' county_id = 1 federal_state_id = 1 countyname = 'westrhein' )
    ).


*   insert the new table entries
    INSERT zcct_county FROM TABLE @itab.

*   output the result as a console message
    out->write( |{ sy-dbcnt } travel entries inserted successfully!| ).

  ENDMETHOD.
ENDCLASS.
