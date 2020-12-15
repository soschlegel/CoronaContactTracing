CLASS lhc_ZCCT_M_FED_STATE DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    CONSTANTS:
      BEGIN OF country_unknown,
        msgid TYPE symsgid VALUE 'ZCCT_FED_STATE',
        msgno TYPE symsgno VALUE '001',
      END OF country_unknown,
      BEGIN OF fedState_empty_name,
        msgid TYPE symsgid VALUE 'ZCCT_FED_STATE',
        msgno TYPE symsgno VALUE '002',
      END OF fedState_empty_name.

    METHODS validateCountryKey FOR VALIDATE ON SAVE
      IMPORTING keys FOR zcct_m_fed_state~validateCountryKey.

    METHODS validateFedStateName FOR VALIDATE ON SAVE
      IMPORTING keys FOR zcct_m_fed_state~validateFedStateName.

ENDCLASS.

CLASS lhc_ZCCT_M_FED_STATE IMPLEMENTATION.


  METHOD validateCountryKey.

    READ ENTITY zcct_m_fed_state\\zcct_m_fed_state FROM VALUE #(
            FOR <root_key> IN keys ( %key-id     = <root_key>-id
                                     %control = VALUE #( countryid = if_abap_behv=>mk-on ) ) )
            RESULT DATA(lt_fedState).

    DATA lt_country TYPE SORTED TABLE OF I_Country WITH UNIQUE KEY Country.

    " Optimization of DB select: extract distinct non-initial country ids
    lt_country = CORRESPONDING #( lt_fedState DISCARDING DUPLICATES MAPPING Country = countryid EXCEPT * ).
    DELETE lt_country WHERE Country IS INITIAL.
    CHECK lt_country IS NOT INITIAL.

    " Check if customer ID exist
    SELECT FROM I_Country FIELDS Country
      FOR ALL ENTRIES IN @lt_country
      WHERE Country = @lt_country-Country
      INTO TABLE @DATA(lt_country_db).

    " Raise msg for non existing customer id
    LOOP AT lt_fedState INTO DATA(ls_fedState).
      IF ls_fedState-countryid IS NOT INITIAL AND NOT line_exists( lt_country_db[ Country = ls_fedState-countryid ] ).
        APPEND VALUE #(  id = ls_fedState-countryid ) TO failed-zcct_m_fed_state.
        APPEND VALUE #(  id = ls_fedState-countryid
                         %msg      = new_message( id       = country_unknown-msgid
                                                  number   = country_unknown-msgno
                                                  v1       = ls_fedState-countryid
                                                  severity = if_abap_behv_message=>severity-error )
                         %element-countryid = if_abap_behv=>mk-on ) TO reported-zcct_m_fed_state.
      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD validateFedStateName.
    READ ENTITY zcct_m_fed_state\\zcct_m_fed_state FROM VALUE #(
    FOR <root_key> IN keys ( %key-id     = <root_key>-id
                                 %control = VALUE #( countryid = if_abap_behv=>mk-on ) ) )
        RESULT DATA(lt_fedState).

    DATA lt_name TYPE SORTED TABLE OF zcct_i_fed_state WITH UNIQUE KEY name.

    lt_name = CORRESPONDING #( lt_fedState DISCARDING DUPLICATES MAPPING name = name EXCEPT * ).
    DELETE lt_name WHERE name IS INITIAL.
    CHECK lt_name IS INITIAL.
    LOOP AT lt_fedState INTO DATA(ls_fedState).
      APPEND VALUE #( id = ls_fedState-id ) TO failed-zcct_m_fed_state.
      APPEND VALUE #(  id = ls_fedState-id
                       %msg      = new_message(   id       = fedState_empty_name-msgid
                                                number   = fedState_empty_name-msgno
                                                v1       = ls_fedState-id
                                                severity = if_abap_behv_message=>severity-error )
                       %element-name = if_abap_behv=>mk-on ) TO reported-zcct_m_fed_state.

    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
