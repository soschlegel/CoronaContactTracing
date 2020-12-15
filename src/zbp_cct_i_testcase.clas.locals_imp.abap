CLASS lhc_testcase DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR testcase RESULT result.

    METHODS setNegative FOR MODIFY
      IMPORTING keys FOR ACTION testcase~setNegative RESULT result.

    METHODS setPositive FOR MODIFY
      IMPORTING keys FOR ACTION testcase~setPositive RESULT result.

    METHODS validateTesttype FOR VALIDATE ON SAVE
      IMPORTING keys FOR testcase~validateTesttype.

    METHODS validatePerson FOR VALIDATE ON SAVE
      IMPORTING keys FOR testcase~validatePerson.

    METHODS validateEmployee FOR VALIDATE ON SAVE
      IMPORTING keys FOR testcase~validateEmployee.

*    METHODS validateTestResultDate FOR VALIDATE ON SAVE
*      IMPORTING keys FOR testcase~validateTestResultDate.

    METHODS validateTestDate FOR VALIDATE ON SAVE
      IMPORTING keys FOR testcase~validateTestDate.

ENDCLASS.

CLASS lhc_testcase IMPLEMENTATION.

  METHOD get_instance_features.
    "%control-<fieldname> specifies which fields are read from the entities

    READ ENTITY zcct_i_testcase FROM VALUE #( FOR keyval IN keys
                                                      (  %key                                = keyval-%key
                                                        %control = VALUE #( testresult       = if_abap_behv=>mk-on
                                                                            testresultdate   = if_abap_behv=>mk-on
                                                                            testresulttime   = if_abap_behv=>mk-on )
                                                         ) )
                                RESULT DATA(lt_testcase_result).

    result = VALUE #( FOR ls_testcase IN lt_testcase_result
                       ( %key                           = ls_testcase-%key
                         %features-%action-setNegative = COND #( WHEN ls_testcase-testresult = ''
                                                                    THEN if_abap_behv=>fc-o-enabled ELSE if_abap_behv=>fc-o-disabled   )
                         %features-%action-setPositive = COND #( WHEN ls_testcase-testresult = ''
                                                                    THEN if_abap_behv=>fc-o-enabled ELSE if_abap_behv=>fc-o-disabled   )
                      ) ).
  ENDMETHOD.

  METHOD setNegative.
    DATA(lv_date) = cl_abap_context_info=>get_system_date( ).
    DATA(lv_time) = cl_abap_context_info=>get_system_time( ).
    " Modify in local mode: BO-related updates that are not relevant for authorization checks
    MODIFY ENTITIES OF zcct_i_testcase IN LOCAL MODE
           ENTITY testcase
              UPDATE FROM VALUE #( FOR key IN keys ( testid = key-testid
                                                     testresult = '' " !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                                     testresultdate = lv_date
                                                     testresulttime = lv_time
                                                     %control = VALUE #( testresult = if_abap_behv=>mk-on
                                                                         testresultdate = if_abap_behv=>mk-on
                                                                         testresulttime = if_abap_behv=>mk-on ) ) )
           FAILED   failed
           REPORTED reported.

    " Read changed data for action result
    READ ENTITIES OF zcct_i_testcase IN LOCAL MODE
         ENTITY testcase
         FROM VALUE #( FOR key IN keys (  testid = key-testid
                                          %control = VALUE #(
                                            personid       = if_abap_behv=>mk-on
                                            employeeid     = if_abap_behv=>mk-on
                                            testtype       = if_abap_behv=>mk-on
                                            testdate       = if_abap_behv=>mk-on
                                            testtime       = if_abap_behv=>mk-on
                                            testresult       = if_abap_behv=>mk-on
                                            testresultdate       = if_abap_behv=>mk-on
                                            testresulttime       = if_abap_behv=>mk-on
                                            created_by      = if_abap_behv=>mk-on
                                            created_at      = if_abap_behv=>mk-on
                                            last_changed_by = if_abap_behv=>mk-on
                                            last_changed_at = if_abap_behv=>mk-on
                                          ) ) )
         RESULT DATA(lt_result).

    result = VALUE #( FOR testcase IN lt_result ( testid = testcase-testid
                                                %param    = testcase ) ).
  ENDMETHOD.

  METHOD setPositive.
    DATA(lv_date) = cl_abap_context_info=>get_system_date( ).
    DATA(lv_time) = cl_abap_context_info=>get_system_time( ).
    " Modify in local mode: BO-related updates that are not relevant for authorization checks
    MODIFY ENTITIES OF zcct_i_testcase IN LOCAL MODE
           ENTITY testcase
              UPDATE FROM VALUE #( FOR key IN keys ( testid = key-testid
                                                     testresult = 'P' " Positive
                                                     testresultdate = lv_date
                                                     testresulttime = lv_time
                                                     %control-testresult = if_abap_behv=>mk-on
                                                     %control-testresultdate = if_abap_behv=>mk-on
                                                     %control-testresulttime = if_abap_behv=>mk-on ) )
           FAILED   failed
           REPORTED reported.

    " Insert Casefile
    GET TIME STAMP FIELD DATA(lv_timestamp).
    READ ENTITY zcct_i_testcase\\testcase FROM VALUE #(
    FOR <root_key> IN keys ( %key-testid     = <root_key>-testid
                             %control = VALUE #( employeeid = if_abap_behv=>mk-on ) ) )
    RESULT DATA(lt_testcase).

    LOOP AT lt_testcase INTO DATA(ls_testcase).
      DATA itab_casefile TYPE TABLE OF zcct_case_file.
      itab_casefile = VALUE #( (
         casefile_id = cl_system_uuid=>create_uuid_x16_static( )
         testcase_id = ls_testcase-testid
         healthdepem_id = ls_testcase-employeeid
         created_at = lv_timestamp
         created_by = sy-uname
         last_changed_at = lv_timestamp
         last_changed_by = sy-uname
       ) ).
      INSERT zcct_case_file FROM TABLE @itab_casefile.
    ENDLOOP.

    " Read changed data for action result
    READ ENTITIES OF zcct_i_testcase IN LOCAL MODE
         ENTITY testcase
         FROM VALUE #( FOR key IN keys (  testid = key-testid
                                          %control = VALUE #(
                                            personid       = if_abap_behv=>mk-on
                                            employeeid     = if_abap_behv=>mk-on
                                            testtype       = if_abap_behv=>mk-on
                                            testdate       = if_abap_behv=>mk-on
                                            testtime       = if_abap_behv=>mk-on
                                            testresult       = if_abap_behv=>mk-on
                                            testresultdate       = if_abap_behv=>mk-on
                                            testresulttime       = if_abap_behv=>mk-on
                                            created_by      = if_abap_behv=>mk-on
                                            created_at      = if_abap_behv=>mk-on
                                            last_changed_by = if_abap_behv=>mk-on
                                            last_changed_at = if_abap_behv=>mk-on
                                          ) ) )
         RESULT DATA(lt_result).

    result = VALUE #( FOR testcase IN lt_result ( testid = testcase-testid
                                                %param    = testcase
                                              ) ).
  ENDMETHOD.

  METHOD validateTesttype.
    READ ENTITY zcct_i_testcase\\testcase FROM VALUE #(
        FOR <root_key> IN keys ( %key-testid     = <root_key>-testid
                                 %control = VALUE #( testtype = if_abap_behv=>mk-on ) ) )
        RESULT DATA(lt_testcase).

    DATA lt_testtype TYPE SORTED TABLE OF zcct_i_testtype WITH UNIQUE KEY testtypeid.

    lt_testtype = CORRESPONDING #( lt_testcase DISCARDING DUPLICATES MAPPING testtypeid = testtype EXCEPT * ).
    DELETE lt_testtype WHERE testtypeid IS INITIAL.
    CHECK lt_testtype IS NOT INITIAL.

    SELECT FROM zcct_i_testtype FIELDS testtypeid
      FOR ALL ENTRIES IN @lt_testtype
      WHERE testtypeid = @lt_testtype-testtypeid
      INTO TABLE @DATA(lt_testtype_db).

    LOOP AT lt_testcase INTO DATA(ls_testcase).
      IF ls_testcase-testtype IS NOT INITIAL AND NOT line_exists( lt_testtype_db[ testtypeid = ls_testcase-testtype ] ).
        APPEND VALUE #(  testid = ls_testcase-testid ) TO failed-testcase.
        APPEND VALUE #(  testid = ls_testcase-testid
                         %msg      = new_message( id       = zif_cct_testcase_messages=>testtype_unknown-msgid
                                                  number   = zif_cct_testcase_messages=>testtype_unknown-msgno
                                                  v1       = ls_testcase-testtype
                                                  severity = if_abap_behv_message=>severity-error )
                         %element-testtype = if_abap_behv=>mk-on ) TO reported-testcase.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


  METHOD validatePerson.
    READ ENTITY zcct_i_testcase\\testcase FROM VALUE #(
        FOR <root_key> IN keys ( %key-testid     = <root_key>-testid
                                 %control = VALUE #( personid = if_abap_behv=>mk-on ) ) )
        RESULT DATA(lt_testcase).

    DATA lt_testperson TYPE SORTED TABLE OF zcct_i_test_person WITH UNIQUE KEY test_person_id.

    lt_testperson = CORRESPONDING #( lt_testcase DISCARDING DUPLICATES MAPPING test_person_id = personid EXCEPT * ).
    DELETE lt_testperson WHERE test_person_id IS INITIAL.
    CHECK lt_testperson IS NOT INITIAL.

    SELECT FROM zcct_i_test_person FIELDS test_person_id
      FOR ALL ENTRIES IN @lt_testperson
      WHERE test_person_id = @lt_testperson-test_person_id
      INTO TABLE @DATA(lt_testperson_db).

    LOOP AT lt_testcase INTO DATA(ls_testcase).
      IF ls_testcase-testtype IS NOT INITIAL AND NOT line_exists( lt_testperson_db[ test_person_id = ls_testcase-personid ] ).
        APPEND VALUE #(  testid = ls_testcase-testid ) TO failed-testcase.
        APPEND VALUE #(  testid = ls_testcase-testid
                         %msg      = new_message( id       = zif_cct_testcase_messages=>person_unknown-msgid
                                                  number   = zif_cct_testcase_messages=>person_unknown-msgno
                                                  v1       = ls_testcase-personid
                                                  severity = if_abap_behv_message=>severity-error )
                         %element-personid = if_abap_behv=>mk-on ) TO reported-testcase.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateEmployee.
    READ ENTITY zcct_i_testcase\\testcase FROM VALUE #(
        FOR <root_key> IN keys ( %key-testid     = <root_key>-testid
                                 %control = VALUE #( employeeid = if_abap_behv=>mk-on ) ) )
        RESULT DATA(lt_testcase).

    DATA lt_employee TYPE SORTED TABLE OF ZCCT_I_HealthDepEm WITH UNIQUE KEY emplyee_id.

    lt_employee = CORRESPONDING #( lt_testcase DISCARDING DUPLICATES MAPPING emplyee_id = employeeid EXCEPT * ).
    DELETE lt_employee WHERE emplyee_id IS INITIAL.
    CHECK lt_employee IS NOT INITIAL.

    SELECT FROM ZCCT_I_HealthDepEm FIELDS emplyee_id
      FOR ALL ENTRIES IN @lt_employee
      WHERE emplyee_id = @lt_employee-emplyee_id
      INTO TABLE @DATA(lt_employee_db).

    LOOP AT lt_testcase INTO DATA(ls_testcase).
      IF ls_testcase-employeeid IS NOT INITIAL AND NOT line_exists( lt_employee_db[ emplyee_id = ls_testcase-employeeid ] ).
        APPEND VALUE #(  testid = ls_testcase-testid ) TO failed-testcase.
        APPEND VALUE #(  testid = ls_testcase-testid
                         %msg      = new_message( id       = zif_cct_testcase_messages=>employee_unknown-msgid
                                                  number   = zif_cct_testcase_messages=>employee_unknown-msgno
                                                  v1       = ls_testcase-employeeid
                                                  severity = if_abap_behv_message=>severity-error )
                         %element-employeeid = if_abap_behv=>mk-on ) TO reported-testcase.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateTestDate.
    DATA(lv_date) = cl_abap_context_info=>get_system_date( ).
    READ ENTITY zcct_i_testcase\\testcase FROM VALUE #(
        FOR <root_key> IN keys ( %key-testid     = <root_key>-testid
                                 %control = VALUE #( testdate = if_abap_behv=>mk-on ) ) )
        RESULT DATA(lt_testcase).

    LOOP AT lt_testcase INTO DATA(ls_result).

      IF ls_result-testdate > lv_date.
        APPEND VALUE #(  testid = ls_result-testid ) TO failed-testcase.
        APPEND VALUE #(  testid = ls_result-testid
                         %msg      = new_message( id       = zif_cct_testcase_messages=>testdate_invalid-msgid
                                                  number   = zif_cct_testcase_messages=>testdate_invalid-msgno
                                                  v1       = zif_cct_testcase_messages=>testdate_invalid-attr1
                                                  v2       = ls_result-testdate
                                                  severity = if_abap_behv_message=>severity-error )
                         %element-testdate = if_abap_behv=>mk-on ) TO reported-testcase.
      ENDIF.

    ENDLOOP.
  ENDMETHOD.

*  METHOD validateTestResultDate.
*    READ ENTITY zcct_i_testcase\\testcase FROM VALUE #(
*        FOR <root_key> IN keys ( %key-testid     = <root_key>-testid
*                                 %control = VALUE #( testresultdate = if_abap_behv=>mk-on
*                                                     testdate = if_abap_behv=>mk-on ) ) )
*        RESULT DATA(lt_testcase).
*
*    LOOP AT lt_testcase INTO DATA(ls_result).
*
*      IF ls_result-testresultdate < ls_result-testdate.
*        APPEND VALUE #(  testid = ls_result-testid ) TO failed-testcase.
*        APPEND VALUE #(  testid = ls_result-testid
*                         %msg      = new_message( id       = zif_cct_testcase_messages=>employee_unknown-msgid
*                                                  number   = zif_cct_testcase_messages=>employee_unknown-msgno
*                                                  v1       = ls_result-testdate
*                                                  v2       = ls_result-testresultdate
*                                                  severity = if_abap_behv_message=>severity-error )
*                         %element-testdate = if_abap_behv=>mk-on ) TO reported-testcase.
*      ENDIF.
*    ENDLOOP.
*  ENDMETHOD.
ENDCLASS.
