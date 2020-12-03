CLASS lhc_Healthdep DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    TYPES tt_healthdep_update TYPE TABLE FOR UPDATE zcct_i_healthdep.

    METHODS CalculateHealthdepKey FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Healthdep~CalculateHealthdepKey.

    METHODS validateCounty FOR VALIDATE ON SAVE
      IMPORTING keys FOR Healthdep~validateCounty.

    METHODS validateLeadingEmployee FOR VALIDATE ON SAVE
      IMPORTING keys FOR Healthdep~validateLeadingEmployee.

ENDCLASS.

CLASS lhc_Healthdep IMPLEMENTATION.

  METHOD CalculateHealthdepKey.
    READ ENTITIES OF zcct_i_healthdep IN LOCAL MODE
       ENTITY Healthdep
           FIELDS ( healthdepid )
           WITH CORRESPONDING #( keys )
       RESULT DATA(lt_healthdep).
    DELETE lt_healthdep WHERE HealthdepId IS NOT INITIAL.
    CHECK lt_healthdep IS NOT INITIAL.

    SELECT SINGLE FROM zcct_healthdep FIELDS MAX( healthdep_id ) INTO @DATA(lv_max_healthdepid).

    MODIFY ENTITIES OF zcct_i_healthdep IN LOCAL MODE
       ENTITY Healthdep
           UPDATE FIELDS ( HealthdepId )
           WITH VALUE #( FOR ls_healthdep IN lt_healthdep INDEX INTO i (
                                   %key = ls_healthdep-%key
                                   HealthdepId = lv_max_healthdepid + i ) )
     REPORTED DATA(lt_reported).


  ENDMETHOD.

  METHOD validateCounty.
    READ ENTITY zcct_i_healthdep\\healthdep FROM VALUE #(
    FOR <root_key> IN keys ( %key-healthdepid     = <root_key>-healthdepid
                                 %control = VALUE #( countyid = if_abap_behv=>mk-on ) ) )
        RESULT DATA(lt_healthdep).

    DATA lt_county TYPE SORTED TABLE OF zcct_c_county_m WITH UNIQUE KEY countyuuid.
    DATA lt2_healthdep TYPE SORTED TABLE OF zcct_i_healthdep WITH UNIQUE KEY healthdepid.

    lt_county = CORRESPONDING #( lt_healthdep DISCARDING DUPLICATES MAPPING countyuuid = CountyId EXCEPT * ).
    DELETE lt_county WHERE countyuuid IS INITIAL.
    CHECK lt_county IS NOT INITIAL.

    SELECT FROM zcct_c_county_m FIELDS countyuuid
       FOR ALL ENTRIES IN @lt_county
       WHERE countyuuid = @lt_county-countyuuid
       INTO TABLE @DATA(lt_county_db).

    SELECT FROM zcct_i_healthdep FIELDS healthdepid, countyid
       FOR ALL ENTRIES IN @lt2_healthdep
       WHERE countyid = @lt2_healthdep-countyid
       INTO TABLE @DATA(lt_healthdep_db).

    LOOP AT lt_healthdep INTO DATA(ls_healthdep).
      IF ls_healthdep-CountyId IS NOT INITIAL AND NOT line_exists( lt_county_db[ countyuuid = ls_healthdep-CountyId ] ).
        APPEND VALUE #(  HealthdepId = ls_healthdep-HealthdepId ) TO failed-healthdep.
        APPEND VALUE #(  HealthdepId = ls_healthdep-HealthdepId
                         %msg      = new_message(  id       = zif_cct_messages=>msgid
                                                  number   = zif_cct_messages=>msgno-county_not_found
                                                  v1       = ls_healthdep-CountyId
                                                  severity = if_abap_behv_message=>severity-error )
                         %element-CountyId = if_abap_behv=>mk-on ) TO reported-healthdep.
      ELSE.
        LOOP AT lt_healthdep_db INTO DATA(ls2_healthdep).
          IF ls_healthdep-CountyId = ls2_healthdep-CountyId AND  NOT ( ls_healthdep-HealthdepId = ls2_healthdep-HealthdepId ).
            APPEND VALUE #(  HealthdepId = ls_healthdep-HealthdepId ) TO failed-healthdep.
            APPEND VALUE #(  HealthdepId = ls_healthdep-HealthdepId
                             %msg      = new_message(  id       = zif_cct_messages=>msgid
                                                  number   = zif_cct_messages=>msgno-county_already_assigned
                                                      v1       = ls_healthdep-CountyId
                                                      severity = if_abap_behv_message=>severity-error )
                             %element-CountyId = if_abap_behv=>mk-on ) TO reported-healthdep.
          ENDIF.
        ENDLOOP.
      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD validateLeadingEmployee.
    READ ENTITY zcct_i_healthdep\\healthdep FROM VALUE #(
    FOR <root_key> IN keys ( %key-healthdepid     = <root_key>-healthdepid
                                 %control = VALUE #( LeadingEmployeeId = if_abap_behv=>mk-on ) ) )
        RESULT DATA(lt_healthdep).

    DATA lt_healthdepem TYPE SORTED TABLE OF zcct_c_healthdepem WITH UNIQUE KEY employee_id.

    lt_healthdepem = CORRESPONDING #( lt_healthdep DISCARDING DUPLICATES MAPPING employee_id = LeadingEmployeeId EXCEPT * ).
    DELETE lt_healthdepem WHERE employee_id IS INITIAL.
    CHECK lt_healthdepem IS NOT INITIAL.

    SELECT FROM zcct_c_healthdepem FIELDS employee_id
       FOR ALL ENTRIES IN @lt_healthdepem
       WHERE employee_id = @lt_healthdepem-employee_id
       INTO TABLE @DATA(lt_healthdepem_db).


    LOOP AT lt_healthdep INTO DATA(ls_healthdep).
      IF ls_healthdep-LeadingEmployeeId IS NOT INITIAL AND NOT line_exists( lt_healthdepem_db[ employee_id = ls_healthdep-LeadingEmployeeId ] ).
        APPEND VALUE #(  HealthdepId = ls_healthdep-HealthdepId ) TO failed-healthdep.
        APPEND VALUE #(  HealthdepId = ls_healthdep-HealthdepId
                         %msg      = new_message(   id       = zif_cct_messages=>msgid
                                                  number   = zif_cct_messages=>msgno-employee_not_found
                                                  v1       = ls_healthdep-LeadingEmployeeId
                                                  severity = if_abap_behv_message=>severity-error )
                         %element-LeadingEmployeeId = if_abap_behv=>mk-on ) TO reported-healthdep.
      ENDIF.

    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
