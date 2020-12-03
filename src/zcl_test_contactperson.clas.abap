CLASS zcl_test_contactperson DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    METHODS: constructor,
      notifyContactpersons RETURNING VALUE(r_json) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: gv_url TYPE string VALUE 'https://coronanotifierheroku.herokuapp.com/notify'.
    DATA: go_http_client TYPE REF TO  if_web_http_client.


ENDCLASS.

CLASS zcl_test_contactperson IMPLEMENTATION.
  METHOD constructor.
    go_http_client = cl_web_http_client_manager=>create_by_http_destination(
              i_destination = cl_http_destination_provider=>create_by_url( gv_url ) ).

  ENDMETHOD.
  METHOD if_oo_adt_classrun~main.
    DATA: notifyTest TYPE REF TO zcl_test_contactperson,
          teststring TYPE string.
    create object notifyTest type zcl_test_contactperson.
    teststring  = notifyTest->notifyContactpersons( ).
    out->write( 'test durchgeführt' ).
    out->write( teststring ).

* Struct -> JSON

  ENDMETHOD.


  METHOD notifyContactpersons.

    TYPES: BEGIN OF ty_struct,
             contact_firstname           TYPE string,
             contact_lastname            TYPE string,
             contact_address_country     TYPE string,
             contact_address_city        TYPE string,
             contact_address_plz         TYPE string,
             contact_address_street      TYPE string,
             contact_address_housenumber TYPE i,
             contact_mail_address        TYPE string,
             contact_telephone_number_1  TYPE string,
             contact_telephone_number_2  TYPE string,
             contact_telephone_number_3  TYPE string,
             contact_has_been_notified   TYPE i,
           END OF ty_struct.

* Test-Daten
    DATA(lv_struct) = VALUE ty_struct(
        contact_firstname = 'max'
        contact_lastname = 'mustermann'
        contact_address_country = 'MUSTERLAND'
        contact_address_city = 'Musterstadt'
        contact_address_plz = '3424'
        contact_address_street = 'Musterstraße'
        contact_address_housenumber = '3'
        contact_mail_address = 'm@m.m'
        contact_telephone_number_1 = '3242342344'
        contact_telephone_number_2 = ''
        contact_telephone_number_3 = ''
        contact_has_been_notified = '1' ).
******************************************************************************************************************
*****************************************************Hier müssen wir das Struct der Kontaktpersonen übergeben!****
*****************************************************Das Struct sollte die selbe Reihenfolge haben wie ty_struct**
    DATA(lv_json_str) = /ui2/cl_json=>serialize( data = lv_struct pretty_name = /ui2/cl_json=>pretty_mode-low_case ).
********************************************************^^^^^^^^^*************************************************
******************************************************************************************************************
    DATA(lo_request) = go_http_client->get_http_request( ).
    lo_request->set_header_fields( VALUE #(
    (  name = 'Content-Type' value = 'application/json' )
    (  name = 'Accept' value = 'application/json' ) ) ).

    lo_request->set_uri_path( i_uri_path = gv_url  ).
    lo_request->set_text( lv_json_str ).
    TRY.
        DATA(lo_response) = go_http_client->execute( i_method = if_web_http_client=>post ).
      CATCH cx_web_http_client_error.
    ENDTRY.
    data(lv_code) = lo_response->get_status( ).
    r_json = lo_response->get_text( ).
  ENDMETHOD.

ENDCLASS.
