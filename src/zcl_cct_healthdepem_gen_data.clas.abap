CLASS zcl_cct_healthdepem_gen_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    METHODS add.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cct_healthdepem_gen_data IMPLEMENTATION.
  METHOD add.

  ENDMETHOD.
  METHOD if_oo_adt_classrun~main.

    DATA itab TYPE TABLE OF ZCCT_HEALTHDEPEM.

*   fill internal travel table (itab)
    itab = VALUE #(
      ( emplyee_id = 1 firstname = 'Bob' lastname = 'Bob'
       created_by = sy-uname created_at = sy-UZEIT
       last_changed_by = sy-uname last_changed_at = sy-UZEIT )
    ).

*   delete existing entries in the database table
    DELETE FROM ZCCT_HEALTHDEPEM.

*   insert the new table entries
    INSERT ZCCT_HEALTHDEPEM FROM TABLE @itab.

*   output the result as a console message
    out->write( |{ sy-dbcnt } travel entries inserted successfully!| ).

    out->write( itab ).

  ENDMETHOD.
ENDCLASS.
