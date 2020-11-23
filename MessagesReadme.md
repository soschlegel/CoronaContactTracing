# Tutorial Nachricht an User senden

Um eine Nachricht an den User senden zu können muss folgendes gemacht werden:
- Die Message Liste findet Ihr unter package "ZCCT"/Texts/Messages Classes/ZCCT_Messages
Dort einfach hochzählend zb. 001, 002, 003 eure Nachrichten anlegen.

- Anschließend in dem Interface _ZCCT/Source Code Library/Interfaces/ZIF_CCT_Messages_, den Namen und die Nummer innerhalb von `msgno` anlegen.

z.B:`patiend_died TYPE symsgno VALUE '012',`

## Beispielsweise:
Die Gruppe 08 hat für die Aufgabe 7 CaseFile eine Validierung validateHealthDepEM hinzugefügt.

In unserer Behavior Klasse _ZCL_CCT_I_CASEFILE_ haben wir in der Methode `validateHealthDepEm` eine Valideriung nach dem _HealthdepEm_. 
Falls dieser nicht existiert wird eine Meldung `employee_not_found` ausgegeben.

**!Wichtig!**
- `id       = zif_cct_messages=>msgid` (original Zeile 44) wird auf das Interface verlinkt 
- `number   = zif_cct_messages=>msgno-employee_not_found` (original Zeile 45) auf die von uns/euch verwendete Nachrichten Nummer verwiesen.
```
IF ls_casefile-healthdepem_id IS NOT INITIAL AND NOT line_exists( lt_employee_db[ emplyee_id = ls_casefile-healthdepem_id ] ).
        APPEND VALUE #(  casefile_id = ls_casefile-casefile_id ) TO failed-casefile.
        APPEND VALUE #(  casefile_id = ls_casefile-casefile_id
                         %msg      = new_message( id       = zif_cct_messages=>msgid
                                                  number   = zif_cct_messages=>msgno-employee_not_found
                                                  v1       = ls_casefile-healthdepem_id
                                                  severity = if_abap_behv_message=>severity-error )
                         %element-healthdepem_id = if_abap_behv=>mk-on ) TO reported-casefile.
      ENDIF.
```


Bei Fragen, könnt ihr euch gerne bei Gruppe 8 melden. 
