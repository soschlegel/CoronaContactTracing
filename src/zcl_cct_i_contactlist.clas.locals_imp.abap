CLASS lhc_Contactlist DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PUBLIC SECTION.
    TYPES:
      BEGIN OF tys_contact_information,
*        client TYPE abap_client,
        contactlist_id              TYPE sysuuid_x16,
        casefile_id                 TYPE sysuuid_x16,
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
        contact_has_been_notified   TYPE abap_boolean,
      END OF tys_contact_information.


  PRIVATE SECTION.

    METHODS notifyContact FOR MODIFY
      IMPORTING keys FOR ACTION Contactlist~notifyContact RESULT result.

ENDCLASS.

CLASS lhc_Contactlist IMPLEMENTATION.

  METHOD notifyContact.

    " Modify in local mode: BO-related updates that are not relevant for authorization checks
    MODIFY ENTITIES OF ZCCT_I_CONTACTLIST IN LOCAL MODE
           ENTITY Contactlist
              UPDATE FIELDS ( contact_has_been_notified )
                 WITH VALUE #( FOR key IN keys ( contactlist_id      = key-contactlist_id
                                       contact_has_been_notified = 'X'          ) ) " Accepted
           FAILED   failed
           REPORTED reported.

    " Read changed data for action result
    READ ENTITIES OF ZCCT_I_CONTACTLIST IN LOCAL MODE
         ENTITY Contactlist
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

  ENDMETHOD.

ENDCLASS.
