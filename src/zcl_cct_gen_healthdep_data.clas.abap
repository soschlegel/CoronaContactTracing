CLASS zcl_cct_gen_healthdep_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cct_gen_healthdep_data IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA itab TYPE TABLE OF zcct_healthdep.

* fill internal table table (itab)
    itab = VALUE #(
    ( name = 'Musterdep' county_id = '00000001' address ='Muesterstraße 1 00000 Musterstadt'
    leading_employee_id = '00000001' additional_description = 'Test health department'
    created_by = 'MUSTERMANN' created_at = '20190612133945.5960060' last_changed_by = 'MUSTERFRAU' last_changed_at = '20190702105400.3647680'  )
    ).

*   delete existing entries in the database table
    DELETE FROM zcct_healthdep.

*   insert the new table entries
    INSERT zcct_healthdep FROM TABLE @itab.

*   output the result as a console message
    out->write( |{ sy-dbcnt } travel entries inserted successfully!| ).
  ENDMETHOD.

ENDCLASS.
