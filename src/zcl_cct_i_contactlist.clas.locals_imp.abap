CLASS lhc_Contactlist DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PUBLIC SECTION.
    TYPES:
      BEGIN OF tys_contact_information,
        contactlist_id              TYPE string,
        casefile_id                 TYPE string,
        contact_firstname           TYPE string,
        contact_lastname            TYPE string,
        contact_telephone_number_1  TYPE string,
        contact_telephone_number_2  TYPE string,
        contact_telephone_number_3  TYPE string,
        contact_mail_address        TYPE string,
        contact_address_street      TYPE string,
        contact_address_plz         TYPE string,
        contact_address_city        TYPE string,
        contact_address_country     TYPE string,
        contact_address_housenumber TYPE string,
        contact_has_been_notified   TYPE string,
      END OF tys_contact_information.

  PRIVATE SECTION.

*    METHODS get_instance_features FOR INSTANCE FEATURES
*      IMPORTING keys REQUEST requested_features FOR Contactlist RESULT result.

    METHODS notifyContact FOR MODIFY
      IMPORTING keys FOR ACTION Contactlist~notifyContact RESULT result.

ENDCLASS.

CLASS lhc_Contactlist IMPLEMENTATION.






*  METHOD get_instance_features.
*  ENDMETHOD.

  METHOD notifyContact.




  ENDMETHOD.

ENDCLASS.
