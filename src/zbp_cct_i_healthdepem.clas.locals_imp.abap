CLASS lhc_HealthDepEm DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    TYPES tt_healthdep_update TYPE TABLE FOR UPDATE zcct_i_healthdepem.

*    METHODS CalculateHealthdepKey FOR DETERMINE ON MODIFY
*      IMPORTING keys FOR Healthdep~CalculateHealthdepKey.

*    METHODS validateName FOR VALIDATE ON SAVE
*      IMPORTING keys FOR Healthdepem~validateName.

    METHODS validateHealthDep FOR VALIDATE ON SAVE
      IMPORTING keys FOR HealthDepEm~validateHealthDep.

ENDCLASS.

CLASS lhc_HealthDepEm IMPLEMENTATION.
  METHOD validateHealthDep.
    READ ENTITY IN LOCAL MODE zcct_i_healthdepem\\healthdepem FROM VALUE #(
    FOR <root_key> IN keys ( %key-emplyee_id     = <root_key>-emplyee_id ) )
        RESULT DATA(lt_healthdepem).

    DATA lt_healthdep TYPE SORTED TABLE OF zcct_c_healthdep WITH UNIQUE KEY HealthDepId.

*    lt_healthdepem = CORRESPONDING #( lt_healthdep DISCARDING DUPLICATES MAPPING employee_id = LeadingEmployeeId EXCEPT * ).
*    DELETE lt_healthdepem WHERE employee_id IS INITIAL.
*    CHECK lt_healthdepem IS NOT INITIAL.

    SELECT FROM zcct_c_healthdep FIELDS HealthDepId
       FOR ALL ENTRIES IN @lt_healthdep
       WHERE HealthdepId = @lt_healthdep-HealthDepId
       INTO TABLE @DATA(lt_healthdep_db).


    LOOP AT lt_healthdepem INTO DATA(ls_healthdepem).
      IF ls_healthdepem-Healthdep_Id IS NOT INITIAL AND NOT line_exists( lt_healthdep_db[ HealthdepId = ls_healthdepem-Healthdep_Id ] ).
        APPEND VALUE #(  emplyee_id = ls_healthdepem-emplyee_id ) TO failed-healthdepem.
        APPEND VALUE #(  emplyee_id = ls_healthdepem-emplyee_id
                         %msg      = new_message(   id       = zif_cct_messages=>msgid
                                                  number   = zif_cct_messages=>msgno-department_not_found
                                                  v1       = ls_healthdepem-Healthdep_Id
                                                  severity = if_abap_behv_message=>severity-error )
                         %element-Healthdep_Id = if_abap_behv=>mk-on ) TO reported-healthdepem.
      ENDIF.

    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
