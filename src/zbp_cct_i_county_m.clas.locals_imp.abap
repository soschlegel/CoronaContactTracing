CLASS lhc_ZCCT_I_COUNTY_M DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    CONSTANTS:
      BEGIN OF county_unknown,
        msgid TYPE symsgid VALUE 'ZCCT_COUNTY',
        msgno TYPE symsgno VALUE '001',
      END OF county_unknown,
      BEGIN OF county_empty_name,
        msgid TYPE symsgid VALUE 'ZCCT_COUNTY',
        msgno TYPE symsgno VALUE '002',
      END OF county_empty_name.

    METHODS CalculateNewKeys FOR DETERMINE ON MODIFY
      IMPORTING keys FOR zcct_i_county_m~CalculateNewKeys.

    METHODS validateFederalState FOR VALIDATE ON SAVE
      IMPORTING keys FOR zcct_i_county_m~validateFederalState.
    METHODS validateCountyName FOR VALIDATE ON SAVE
      IMPORTING keys FOR zcct_i_county_m~validateCountyName.

ENDCLASS.

CLASS lhc_ZCCT_I_COUNTY_M IMPLEMENTATION.

  METHOD CalculateNewKeys.
    READ ENTITIES OF zcct_i_county_m IN LOCAL MODE
         ENTITY zcct_i_county_m
           FIELDS ( county_id )
           WITH CORRESPONDING #( keys )
         RESULT DATA(lt_counties).

    DELETE lt_counties WHERE county_id IS NOT INITIAL.
    CHECK lt_counties IS NOT INITIAL.

    "Get max travelID
    SELECT SINGLE FROM zcct_i_county_m FIELDS MAX( county_id ) INTO @DATA(lv_max_countyId).

    "update involved instances
    MODIFY ENTITIES OF zcct_i_county_m IN LOCAL MODE
      ENTITY zcct_i_county_m
        UPDATE FIELDS ( county_id )
        WITH VALUE #( FOR ls_county IN lt_counties INDEX INTO i (
                           %key      = ls_county-%key
                           county_id  = lv_max_countyId + i ) )
    REPORTED DATA(lt_reported).
  ENDMETHOD.

  METHOD validateFederalState.
    READ ENTITY zcct_i_county_m\\zcct_i_county_m FROM VALUE #(
           FOR <root_key> IN keys ( %key-countyuuid     = <root_key>-countyuuid
                                    %control = VALUE #( federal_state_id = if_abap_behv=>mk-on ) ) )
           RESULT DATA(lt_county).

    DATA lt_fedstate TYPE SORTED TABLE OF zcct_i_fed_state WITH UNIQUE KEY id.


    lt_fedstate = CORRESPONDING #( lt_county DISCARDING DUPLICATES MAPPING id = federal_state_id EXCEPT * ).
    DELETE lt_fedstate WHERE id IS INITIAL.
    CHECK lt_fedstate IS NOT INITIAL.


    SELECT FROM zcct_fedstate FIELDS id
      FOR ALL ENTRIES IN @lt_fedstate
      WHERE id = @lt_fedstate-id
      INTO TABLE @DATA(lt_fedstate_db).


    LOOP AT lt_county INTO DATA(ls_county).
      IF ls_county-federal_state_id IS NOT INITIAL AND NOT line_exists( lt_fedstate_db[ id = ls_county-federal_state_id ] ).
        APPEND VALUE #(  countyuuid = ls_county-countyuuid ) TO failed-zcct_i_county_m.
        APPEND VALUE #(  countyuuid = ls_county-countyuuid
                         %msg      = new_message( id       = county_unknown-msgid
                                                  number   = county_unknown-msgno
                                                  v1       = ls_county-federal_state_id
                                                  severity = if_abap_behv_message=>severity-error )
                         %element-federal_state_id = if_abap_behv=>mk-on ) TO reported-zcct_i_county_m.
      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD validateCountyName.
    READ ENTITY zcct_i_county_m\\zcct_i_county_m FROM VALUE #(
    FOR <root_key> IN keys ( %key-countyuuid     = <root_key>-countyuuid
                                 %control = VALUE #( countyuuid = if_abap_behv=>mk-on ) ) )
        RESULT DATA(lt_county).

    DATA lt_name TYPE SORTED TABLE OF zcct_c_county_m WITH UNIQUE KEY countyname.

    lt_name = CORRESPONDING #( lt_county DISCARDING DUPLICATES MAPPING countyname = countyname EXCEPT * ).
    DELETE lt_name WHERE countyname IS INITIAL.
    CHECK lt_name IS INITIAL.
    LOOP AT lt_county INTO DATA(ls_county).
      APPEND VALUE #( countyuuid = ls_county-countyuuid ) TO failed-zcct_i_county_m.
      APPEND VALUE #(  countyuuid = ls_county-countyuuid
                       %msg      = new_message(   id       = county_empty_name-msgid
                                                number   = county_empty_name-msgno
                                                v1       = ls_county-countyuuid
                                                severity = if_abap_behv_message=>severity-error )
                       %element-countyname = if_abap_behv=>mk-on ) TO reported-zcct_i_county_m.

    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
