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
*     READ ENTITIES OF zcct_i_healthdep IN LOCAL MODE
*        ENTITY Healthdep
*            FIELDS ( healthdepid )
*            WITH CORRESPONDING #( keys )
*        RESULT DATA(lt_healthdep).
*     DELETE lt_healthdep WHERE HealthdepId IS NOT INITIAL.
*     CHECK lt_healthdep IS NOT INITIAL.
*
*     SELECT SINGLE FROM zcct_healthdep FIELDS MAX( healthdep_id ) INTO @DATA(lv_max_healthdepid).
*
*     MODIFY ENTITIES OF zcct_i_healthdep IN LOCAL MODE
*        ENTITY Healthdep
*            UPDATE FIELDS ( HealthdepId )
*            WITH VALUE #( FOR ls_healthdep IN lt_healthdep INDEX INTO i (
*                                    %key = ls_healthdep-%key
*                                    HealthdepId = lv_max_healthdepid + i ) )
*      REPORTED DATA(lt_reported).
*
*
  ENDMETHOD.

  METHOD validateCounty.
*    READ ENTITY zcct_i_healthdep\\healthdep FROM VALUE #(
*    FOR <root_key> IN keys ( %key-healthdepid     = <root_key>-healthdepid
*                                 %control = VALUE #( countyid = if_abap_behv=>mk-on ) ) )
*        RESULT DATA(lt_healthdep).
*
*     DATA lt_county TYPE SORTED TABLE OF zcct_c_county_m WITH UNIQUE KEY countyuuid.
*
*     lt_county = CORRESPONDING #( lt_healthdep DISCARDING DUPLICATES MAPPING countyuuid = CountyId EXCEPT * ).
*     DELETE lt_county WHERE countyuuid IS INITIAL.
*     CHECK lt_county IS NOT INITIAL.
*
*     SELECT FROM zcct_c_county_m FIELDS countyuuid
*        FOR ALL ENTRIES IN @lt_county
*        WHERE countyuuid = @lt_county-countyuuid
*        INTO TABLE @DATA(lt_county_db).
*
  ENDMETHOD.

  METHOD validateLeadingEmployee.
  ENDMETHOD.

ENDCLASS.
