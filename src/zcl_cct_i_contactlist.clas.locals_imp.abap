CLASS lhc_Contactlist DEFINITION INHERITING FROM cl_abap_behavior_handler.
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
