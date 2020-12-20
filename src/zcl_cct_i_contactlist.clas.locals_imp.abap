CLASS lhc_Contactlist DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PUBLIC SECTION.
    TYPES:
      BEGIN OF tys_contact_information,
*        client TYPE abap_client,
        contactlist_id                  TYPE sysuuid_x16,
        casefile_id                     TYPE sysuuid_x16,
        contact_firstname(40)           TYPE  c,
        contact_lastname(40)            TYPE c,
        contact_telephone_number_1(30)  TYPE c,
        contact_telephone_number_2(30)  TYPE c,
        contact_telephone_number_3(30)  TYPE c,
        contact_mail_address(40)        TYPE c,
        contact_address_street(40)      TYPE c,
        contact_address_plz(40)         TYPE c,
        contact_address_city(40)        TYPE c,
        contact_address_country(40)     TYPE c,
        contact_address_housenumber(40) TYPE c,
        contact_has_been_notified       TYPE abap_boolean,
      END OF tys_contact_information.


  PRIVATE SECTION.

*    DATA: contactpersoncontacter TYPE REF TO zcl_test_contactperson.

    METHODS notifyContact FOR MODIFY
      IMPORTING keys FOR ACTION ContactlistEntity~notifyContact RESULT result.
    METHODS validate_contactlist        FOR VALIDATE ON SAVE
      IMPORTING keys
                  FOR ContactlistEntity~validateContactlist.


ENDCLASS.

CLASS lhc_Contactlist IMPLEMENTATION.

  METHOD notifyContact.

    " Modify in local mode: BO-related updates that are not relevant for authorization checks
    MODIFY ENTITIES OF zcct_i_contactlist IN LOCAL MODE
           ENTITY ContactlistEntity
              UPDATE FIELDS ( contact_has_been_notified )
                 WITH VALUE #( FOR key IN keys ( contactlist_id      = key-contactlist_id
                                       contact_has_been_notified = 'X'          ) ) " Accepted
           FAILED   failed
           REPORTED reported.

    " Read changed data for action result
    READ ENTITIES OF zcct_i_contactlist IN LOCAL MODE
         ENTITY ContactlistEntity
           FIELDS ( contactlist_id
                    casefile_id
                    contact_firstname
                    contact_lastname
                    contact_telephone_number_1
                    contact_telephone_number_2
                    contact_telephone_number_3
                    contact_mail_address
                    contact_address_street
                    contact_address_plz
                    contact_address_city
                    contact_address_country
                    contact_address_housenumber
                    contact_has_been_notified

                    )
             WITH VALUE #( FOR key IN keys ( contactlist_id = key-contactlist_id ) )
         RESULT DATA(lt_contact).

    result = VALUE #( FOR contact IN lt_contact ( contactlist_id = contact-contactlist_id
                                                %param    = contact ) ).


*    IF contactpersoncontacter IS NOT BOUND.
*      CREATE OBJECT contactpersoncontacter.
*    ENDIF.
*    DATA container TYPE zcl_test_contactperson=>ty_struct.
*    LOOP AT  lt_contact INTO DATA(con).
*      container = VALUE zcl_test_contactperson=>ty_struct(
*          contact_firstname = con-contact_firstname
*          contact_lastname = con-contact_lastname
*           contact_address_country = con-contact_address_country
*           contact_address_city = con-contact_address_city
*           contact_address_plz = con-contact_address_plz
*           contact_address_street = con-contact_address_street
*           contact_address_housenumber = con-contact_address_housenumber
*           contact_mail_address = con-contact_mail_address
*           contact_telephone_number_1 = con-contact_telephone_number_1
*           contact_telephone_number_2 = con-contact_telephone_number_2
*           contact_telephone_number_3 = con-contact_telephone_number_3
*           contact_has_been_notified = con-contact_has_been_notified
*      ).
*
*      zcl_test_contactperson=>notifyContactpersons( iv_struct = container ).

*    ENDLOOP.

  ENDMETHOD.

  METHOD validate_contactlist.


    "Read Contact
    READ ENTITIES OF zcct_i_contactlist IN LOCAL MODE
        ENTITY ContactlistEntity
        FROM VALUE #(
            FOR ls_key
            IN keys (   %key-contactlist_id = ls_key-contactlist_id
                        %control            = VALUE #( contactlist_id       = if_abap_behv=>mk-on
                                                       contact_firstname    = if_abap_behv=>mk-on
                                                       contact_lastname     = if_abap_behv=>mk-on
                                                       casefile_id          = if_abap_behv=>mk-on ) ) )
        RESULT DATA(lt_contactlist).


*    " Check if casefile ID exist
    SELECT FROM zcct_i_casefile
        FIELDS casefile_id
        FOR ALL ENTRIES IN @lt_contactlist
        WHERE casefile_id = @lt_contactlist-casefile_id
         INTO TABLE @DATA(lt_casefile_db).

    " Raise msg for non existing customer id
    LOOP AT lt_contactlist INTO DATA(lt_contact).
      " Check associated with casefile
      IF lt_contact-casefile_id IS NOT INITIAL AND NOT line_exists( lt_casefile_db[ casefile_id = lt_contact-casefile_id ] ).
        APPEND VALUE #(  contactlist_id = lt_contact-contactlist_id ) TO failed-ContactlistEntity.
        APPEND VALUE #(  contactlist_id = lt_contact-contactlist_id
                         %msg      = new_message( id       = zif_cct_messages=>msgid
                                                  number   = zif_cct_messages=>msgno-associated_casefile_not_valid
                                                  v1       = lt_contact-casefile_id
                                                  severity = if_abap_behv_message=>severity-error )
                         %element-casefile_id = if_abap_behv=>mk-on ) TO reported-ContactlistEntity.
      ENDIF.
      "Check first name
      IF lt_contact-contact_firstname IS INITIAL.
        APPEND VALUE #(  contactlist_id = lt_contact-contactlist_id ) TO failed-ContactlistEntity.
        APPEND VALUE #(  contactlist_id = lt_contact-contactlist_id
                         %msg      = new_message(  id       = zif_cct_messages=>msgid
                                                  number   = zif_cct_messages=>msgno-first_name_required
                                                  severity = if_abap_behv_message=>severity-error )
                         %element-contact_firstname = if_abap_behv=>mk-on ) TO reported-ContactlistEntity.
      ENDIF.
      "Check last name
      IF lt_contact-contact_lastname IS INITIAL.
        APPEND VALUE #(  contactlist_id = lt_contact-contactlist_id ) TO failed-ContactlistEntity.
        APPEND VALUE #(  contactlist_id = lt_contact-contactlist_id
                         %msg      = new_message(  id       = zif_cct_messages=>msgid
                                                  number   = zif_cct_messages=>msgno-last_name_required
                                                  severity = if_abap_behv_message=>severity-error )
                         %element-contact_lastname = if_abap_behv=>mk-on ) TO reported-ContactlistEntity.
      ENDIF.

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
