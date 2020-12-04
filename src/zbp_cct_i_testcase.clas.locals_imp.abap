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

ENDCLASS.

CLASS lhc_testcase IMPLEMENTATION.

  METHOD get_instance_features.
    "%control-<fieldname> specifies which fields are read from the entities

    READ ENTITY zcct_i_testcase FROM VALUE #( FOR keyval IN keys
                                                      (  %key                                = keyval-%key
                                                        %control = VALUE #( testresult       = if_abap_behv=>mk-on )
                                                         ) )
                                RESULT DATA(lt_testcase_result).

    result = VALUE #( FOR ls_testcase IN lt_testcase_result
                       ( %key                           = ls_testcase-%key
                         %features-%action-setNegative = COND #( WHEN ls_testcase-testresult = 'A'
                                                                    THEN if_abap_behv=>fc-o-enabled ELSE if_abap_behv=>fc-o-disabled   )
                         %features-%action-setPositive = COND #( WHEN ls_testcase-testresult = 'A'
                                                                    THEN if_abap_behv=>fc-o-enabled ELSE if_abap_behv=>fc-o-disabled   )
                      ) ).
  ENDMETHOD.

  METHOD setNegative.
    " Modify in local mode: BO-related updates that are not relevant for authorization checks
    MODIFY ENTITIES OF zcct_i_testcase IN LOCAL MODE
           ENTITY testcase
              UPDATE FROM VALUE #( FOR key IN keys ( testid = key-testid
                                                     testresult = 'N' " Negative
                                                     testresultdate = sy-datum
                                                     testresulttime = sy-uzeit
                                                     %control-testresult = if_abap_behv=>mk-on
                                                     %control-testresultdate = if_abap_behv=>mk-on
                                                     %control-testresulttime = if_abap_behv=>mk-on ) )
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
                                                %param    = testcase
                                              ) ).
  ENDMETHOD.

  METHOD setPositive.
    " Modify in local mode: BO-related updates that are not relevant for authorization checks
    MODIFY ENTITIES OF zcct_i_testcase IN LOCAL MODE
           ENTITY testcase
              UPDATE FROM VALUE #( FOR key IN keys ( testid = key-testid
                                                     testresult = 'P' " Positive
                                                     testresultdate = sy-datum
                                                     testresulttime = sy-uzeit
                                                     %control-testresult = if_abap_behv=>mk-on
                                                     %control-testresultdate = if_abap_behv=>mk-on
                                                     %control-testresulttime = if_abap_behv=>mk-on ) )
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
                                                %param    = testcase
                                              ) ).
  ENDMETHOD.

  METHOD validateTesttype.
    READ ENTITY zcct_i_testcase\\testcase FROM VALUE #(
        FOR <root_key> IN keys ( %key-testid     = <root_key>-testid
                                 %control = VALUE #( testtype = if_abap_behv=>mk-on ) ) )
        RESULT DATA(lt_testcase).

    DATA lt_testtype TYPE SORTED TABLE OF zcct_testtype WITH UNIQUE KEY testtypeid.

    " Optimization of DB select: extract distinct non-initial customer IDs
    lt_testtype = CORRESPONDING #( lt_testcase DISCARDING DUPLICATES MAPPING testtypeid = testtype EXCEPT * ).
    DELETE lt_testtype WHERE testtypeid IS INITIAL.
    CHECK lt_testtype IS NOT INITIAL.

    " Check if customer ID exist
    SELECT FROM zcct_testtype FIELDS testtypeid
      FOR ALL ENTRIES IN @lt_testtype
      WHERE testtypeid = @lt_testtype-testtypeid
      INTO TABLE @DATA(lt_testtype_db).

    " Raise msg for non existing customer id
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
ENDCLASS.
