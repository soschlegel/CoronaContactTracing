CLASS zcl_test_contactperson DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
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

    DATA: iv_struct TYPE ty_struct.

    CLASS-METHODS: class_constructor, notifyContactpersons IMPORTING iv_struct TYPE ty_struct RETURNING VALUE(r_json) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.

    CLASS-DATA: gv_url TYPE string VALUE 'https://coronanotifierheroku.herokuapp.com/notify'.
    CLASS-DATA: go_http_client TYPE REF TO  if_web_http_client.

ENDCLASS.



CLASS zcl_test_contactperson IMPLEMENTATION.

  METHOD class_constructor.
    TRY.
        go_http_client = cl_web_http_client_manager=>create_by_http_destination(
                 i_destination = cl_http_destination_provider=>create_by_url( gv_url ) ).
      CATCH cx_web_http_client_error cx_http_dest_provider_error.
        "handle exception
    ENDTRY.

  ENDMETHOD.

  METHOD notifyContactpersons.


    DATA(lv_json_str) = /ui2/cl_json=>serialize( data = iv_struct pretty_name = /ui2/cl_json=>pretty_mode-low_case ).


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

    DATA(lv_code) = lo_response->get_status( ).
    r_json = lo_response->get_text( ).


  ENDMETHOD.





ENDCLASS.
