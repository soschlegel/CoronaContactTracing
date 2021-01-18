# Aufgabe 9 - API & Benachrichtigung der Nutzer
Dieser Guide erläutert die einzelnen Schritte , die zum Deployment einer eigenen Node.js Anwendung mit Heroku erforderlich sind.
## Aufgabenstellung:
Es soll eine API bereitgestellt werden, die über eine ABAP Schnittstelle eine interne Tabelle in Form von JSON übergeben bekommt, die anschließend in eine Datenbank abgelegt werden.

##Voraussetzungen:
- Fertige Node.js Anwendung (node und npm installiert)
- git installiert
## Umsetzung:
Für das Hosten der API auf einem Cloud-Server wurde Heroku gewählt, weil es im kleinen Rahmen zum prototypischen Testen kostenfrei nutzbar ist.
Heroku ist auf allen gängigen Betriebssystemen (Windows, Mac, Linux) verfügbar und kann unter folgendem Link heruntergeladen, bzw. installiert werden: https://devcenter.heroku.com/articles/getting-started-with-nodejs#set-up.
Für die Nutzung von Heroku wird ein kostenloser Account vorausgesetzt. Genannter Link stellt ebenfalls die Grundlage dieses Guides dar.

Sobald Heroku installiert ist, kann Heroku gestartet werden. Dafür loggt man sich über die Command Line zunächst ein:

```shell
heroku login
```
Im Normalfall sollte der obige Befehl ein Browserfenster öffnen, in dem man die Authentifizierung des Logins abläuft.


Im nächsten Schritt wird die App erstellt und deployed. Dafür wechselt man in der Konsole in das Wurzelverzeichnis der Node.js Anwendung ('RemoteAPI' in diesem Fall) und startet folgenden Befehl:
```shell
heroku create
```
Dieser Befehl erstellt eine neue Heroku App mit einem zufälligen Namen. Optional kann auch noch ein weiterer Parameter als Name der Heroku App übergeben werden.

Gleichzeitig wird ein neues Remote-Repository mit dem gleichen Namen erstellt, das mit dem lokalen Repository der Node.js Anwendung verbunden ist.
Um den Code nun auf Heroku zu deployen muss das lokale Repository nur noch auf das Heroku Remote-Repository gepushed werden:
```shell
git push heroku main
```
Zum Sicherstellen, dass mindestens eine Instanz der Anwendung läuft:

```shell
heroku ps:scale web=1
```
Um die deployte Anwendung auf der Webseite zu öffnen:
```shell
heroku open
```