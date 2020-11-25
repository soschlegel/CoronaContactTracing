# Aufgabe 5

## Welche Funktionalität wird von uns bereit gestellt
unsere Aufgabe war es, eine Blaupause für Testpersonen zu schaffen, mit deren Hilfe beliebig viele Instanzen von Testpersonen in die Datenbank geladen werden können. Testpersonen können erstellt, geändert und gelöscht werden. Sie besitzen folgende Attribute:

| Name des Attributs | Beschreibung                                        |  Sichtbar  | 
| :--------------:   | :-------------------------------------------------: | :------:   |
| client             |   Schlüssel des SAP-Nutzers   |  nein |
| test_person_id     | der Schlüssel zur Testperson | ja |
| firstname          | Vorname der Testperson | ja |
| lastname           | Nachname der Testperson | ja |
| age                | das Alter der Testperson | ja |
| gender             | das Geschlecht der Testperson | ja | 
| county             | das Bundesland, in dem die Testperson wohnt | ja |
| health department  | das Gesundheitsamt, das für die Testperson zuständig ist | ja |
| status             | Status des CoronaTests, unterschieden wird zwischen "nstartet, pending, positive negative"... wir wissen noch nicht ob das gebraucht wird, aktuell unsichtbares Attribut, falls es gebraucht wird ist es da | nein |
| created_by         | von wem erstellt | nein |
| created_at         | wann erstellt | nein |
| last_changed_by    | von wem zuletzt geändert | nein |
| last_changed_at    | wann zuletzt geändert | nein |

Dabei existiert beim County eine Anbindung an die von Aufgabe 2 (Gruppe 2) geschaffene Klasse zu den Bundesländern, wir durchsuchen ihre Tabelle.

Dabei existiert beim Health Department eine Anbindung an die von Aufgabe 3 (Gruppe 3) geschaffene Klasse zu den Gesundheitsämtern, wir durchsuchen ihre Tabelle.


## Welche Komponenten wurden von uns realisiert
| Art der Klasse                      | Klassenname            | 
| :---------------------------------: | :--------------------: | 
| Service Binding                     | ZSB_CCT_TEST_PERSON    | 
| Service Definition                  | ZSD_CCT_TEST_PERSON    | 
| Data Definition (Projection)        | ZCCT_C_Test_person     | 
| Data Definition (Model)             | ZCCT_I_Test_person     | 
| Behaviour Definition (Projection)   | ZCCT_C_Test_person     | 
| Behaviour Definition (Model)        | ZCCT_I_Test_person     | 
| Data Base Table                     | zcct_testperson        | 






