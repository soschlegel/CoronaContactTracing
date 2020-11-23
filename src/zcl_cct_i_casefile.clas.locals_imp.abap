*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lhc_casefile DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS validateHealthDepEm FOR VALIDATE ON SAVE
      IMPORTING keys FOR casefile~validateHealthDepEm.

    METHODS validateTestCase FOR VALIDATE ON SAVE
      IMPORTING keys FOR casefile~validateTestCase.

ENDCLASS.

CLASS lhc_casefile IMPLEMENTATION.

  METHOD validateHealthDepEm.

    READ ENTITY zcct_i_casefile FROM VALUE #(
        FOR <root_key> IN keys ( %key-sysuuid_x16   = <root_key>-sysuuid_x16
                                 %control           = VALUE #( healthdepem = if_abap_behv=>mk-on ) ) )
        RESULT DATA(lt_casefile).

    DATA lt_healthdepem TYPE SORTED TABLE OF zcct_i_healthdepem WITH UNIQUE KEY emplyee_id.

    " Optimization of DB select: extract distinct non-initial customer IDs
    lt_healthdepem = CORRESPONDING #( lt_healthdepem DISCARDING DUPLICATES MAPPING emplyee_id = emplyee_id EXCEPT * ).
    DELETE lt_healthdepem WHERE emplyee_id IS INITIAL.
    CHECK lt_healthdepem IS NOT INITIAL.

    " Check if customer ID exist
    SELECT FROM zcct_i_healthdepem FIELDS emplyee_id
      FOR ALL ENTRIES IN @lt_healthdepem
      WHERE emplyee_id = @lt_healthdepem-emplyee_id
      INTO TABLE @DATA(lt_employee_db).

    " Raise msg for non existing customer id
    LOOP AT lt_casefile INTO DATA(ls_casefile).
      IF ls_casefile-healthdepem IS NOT INITIAL AND NOT line_exists( lt_employee_db[ emplyee_id = ls_casefile-healthdepem ] ).
        APPEND VALUE #(  sysuuid_x16 = ls_casefile-sysuuid_x16 ) TO failed-casefile.
        APPEND VALUE #(  sysuuid_x16 = ls_casefile-sysuuid_x16
                         %msg      = new_message( id       = zif_cct_messages=>msgid
                                                  number   = zif_cct_messages=>msgno-employee_not_found
                                                  v1       = ls_casefile-healthdepem
                                                  severity = if_abap_behv_message=>severity-error )
                         %element-healthdepem = if_abap_behv=>mk-on ) TO reported-casefile.
      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD validateTestCase.
  ENDMETHOD.

ENDCLASS.
