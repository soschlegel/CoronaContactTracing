CLASS zcct_cct_gen_contactlist_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcct_cct_gen_contactlist_data IMPLEMENTATION.
 METHOD if_oo_adt_classrun~main.
*
*    DATA itab TYPE TABLE OF zcct_contactlist.
*
**   fill internal travel table (itab)
*    itab = VALUE #(
*      (
*      contact_address_city = 'Musterstadt'
*      contact_address_country = 'MUSTERLAND'
*      contact_address_housenumber = '3'
*      contact_address_plz = '3424'
*      contact_address_street = 'Musterstraße'
*      contact_firstname = 'max'
*      contact_lastname = 'mustermann'
*      contact_has_been_notified = 'X'
*      contact_mail_address = 'm@m.m'
*      contact_telephone_number_1 = '3242342344'
*      contact_telephone_number_2 = ''
*      contact_telephone_number_3 = ''
*     )
*     (
*      contact_address_city = 'antistadt'
*      contact_address_country = 'antipattern'
*      contact_address_housenumber = '3'
*      contact_address_plz = '3424'
*      contact_address_street = 'anstistraße'
*      contact_firstname = 'antimax'
*      contact_lastname = 'antimann'
*      contact_has_been_notified = 'X'
*      contact_mail_address = 'm2@m.m'
*      contact_telephone_number_1 = '3242342344'
*      contact_telephone_number_2 = ''
*      contact_telephone_number_3 = ''
*     )
*
*    ).
*
**   delete existing entries in the database table
*    DELETE FROM zcct_contactlist.
*
**   insert the new table entries
*    INSERT zcct_contactlist FROM TABLE @itab.
*
**   output the result as a console message
*    out->write( |{ sy-dbcnt } travel entries inserted successfully!| ).

  ENDMETHOD.
ENDCLASS.
