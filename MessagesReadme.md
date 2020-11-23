# Tutorial Nachricht an User senden

Um eine Nachricht an den User senden zu können muss folgendes gemacht werden:
- Die Message Liste findet Ihr unter package "ZCCT"/Texts/Messages Classes/ZCCT_Messages
Dort einfach hochzählend zb. 001, 002, 003 eure Nachrichten anlegen.

- Anschließend in dem Interface ZCCT/Source Code Library/Interfaces/ZIF_CCT_Messages, den Namen und die Nummer anlegen.

## Beispielsweise:
Die Gruppe 08 hat für die Aufgabe 7 CaseFile eine Validierung validateHealthDepEM hinzugefügt.

In unserer Behavior Klasse "ZCL_CCT_I_CASEFILE" haben wir in der Methode validateHealthDepEm eine Valideriung nach dem HealthdepEm. 
Falls dieser nicht existiert wird eine Meldung "employee_not_found" ausgegeben.

!Wichtig! Zeile 44 wird auf das Interface verlinkt /45 auf die von uns/euch verwendete Nachrichten Nummer verwiesen.

Bei Fragen, könnt ihr euch gerne bei Gruppe 8 melden. 
