INTERFACE zif_cct_testcase_messages
  PUBLIC .

  CONSTANTS:
    msgid TYPE symsgid VALUE 'ZCCT_TC_MESSAGES',

    BEGIN OF testtype_unknown,
      msgid TYPE symsgid VALUE 'Testart unbekannt',
      msgno TYPE symsgno VALUE '001',
    END OF testtype_unknown,

    BEGIN OF person_unknown,
      msgid TYPE symsgid VALUE 'Person unbekannt',
      msgno TYPE symsgno VALUE '002',
    END OF person_unknown,

    BEGIN OF employee_unknown,
      msgid TYPE symsgid VALUE 'Mitarbeiter unb.',
      msgno TYPE symsgno VALUE '003',
    END OF employee_unknown,



    BEGIN OF testdate_invalid,
      msgid TYPE symsgid VALUE 'Testdatum',
      msgno TYPE symsgno VALUE '004',
      attr1 TYPE scx_attrname VALUE 'Testdatum darf nicht in Zukunft liegen.',
    END OF testdate_invalid.

*    BEGIN OF testresultdate_future,
*      msgid TYPE symsgid VALUE 'Testdatum',
*      msgno TYPE symsgno VALUE '003',
*      attr1 TYPE scx_attrname VALUE 'Testdatum darf nicht in Zukunft liegen.',
*    END OF testresultdate_future.

ENDINTERFACE.
