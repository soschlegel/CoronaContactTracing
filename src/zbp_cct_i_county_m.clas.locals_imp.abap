CLASS lhc_ZCCT_I_COUNTY_M DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS CalculateNewKeys FOR DETERMINE ON MODIFY
      IMPORTING keys FOR zcct_i_county_m~CalculateNewKeys.

    METHODS validateFederalState FOR VALIDATE ON SAVE
      IMPORTING keys FOR zcct_i_county_m~validateFederalState.

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
  ENDMETHOD.

ENDCLASS.
