# Actions:

## Action beginnt im CDS Behaviour. 
Dort wird deklariert welche Aktionen es gibt. create, update, delete sind Standardaktionen die einfach so funktionieren sobald man gesagt hat dass man sie will, für eigendefinierte ist die SAPsupport docu sogar relativ gut.

### Beispiel
```
define behavior for ZCCT_I_CONTACTLIST alias Contactlist
persistent table zcct_contactlist
lock master
{

  field ( readonly, numbering : managed ) contactlist_id;

  create;
  update;
  delete;


  action notifyContact result [1] $self;
}
```
### Erklärung
Wir machen Behaviour für Tabelle zcct_contactlist,
die contactlist_id ist read-only
wir wollen creat, update und delete, die werden dann von SAP standard eingehängt
wir definieren eine eigene Aktion namens notifyContact, das Ergebnis der Aktion ist der gleiche Dateneintrag auf dem ie ausgeführt wird ($self) und daher gibt es nur ein Ergebnis ([1])


## Nächster Schritt, Projection behaviour:
alle Aktionen die wir exposen wollen weiterreichen
### Beispiel
```
define behavior for ZCCT_C_CONTACTLIST 
{
  use create;
  use update;
  use delete;

  use action notifyContact;
}
```
### Erklärung
Die Standartaktionen wieder und dann unsere eigene,, wir machen hier nichts wirklich sondern sind einfach verbinden zwischen Datenbank und Toplayer.

##In GUI einbinden
So weit so gut, jetzt "gibt" es die Aktion und sie ist für die GUI "verfügbar", aber SAP weiß noch nicht wo es den Knopf dafür hinpacken muss also lässt es den weg.
Button hinzufügen:
In der Projection View müssen wir die Aktion zu nem Feld binden. Auch wenn es nichts mit dem Feld zu hat, oder es kein Feld gibt zu dem es passt, es muss halt, dann taucht der Knopf auf. Voodoo magic, just do it.
In einer @UI annotation, entweder für lineItem (für die Tabellenansicht), oder identification (für die Detailansicht) füge die option hinzu 
type: #FOR_ACTION, dataAction: 'meinAktionsname' 

### Beispiel
```
identification: [ { position: 10, 
                                label: 'Casefile ID',
                                type: #FOR_ACTION, dataAction: 'notifyContact'  } ]
```						
und der Knopf erscheint

##Jetzt kann eine Klasse mit Implementation erstellt werden und fertig.
