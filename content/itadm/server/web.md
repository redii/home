---
title: "Webserver"
date: 2020-12-16T16:32:22Z
draft: false
---

# Installation und Konfiguration - Apache2
unter Ubuntu 20.04 LTS

## 🚀 Ziel der Aufgabe
Die Aufgabe besteht darin einen Apache Webserver auf Ihrem System zu installieren und anschließend zu konfigurieren. Das grobe Ziel ist, dass Sie neben der Apache-Default Seite des Servers eine zweite Webseite zeitgleich betreiben.

Um eine zweite Webseite zeitgleich zu betreiben, müssen Sie zunächst einen weiteren Port z.B. 3000 für den Server konfigurieren. Dadurch können Sie anschließend eine Webseite über den Port 80 und eine andere über den Port 3000 durch den selber Serverhost betreiben.

### 1. Installieren Sie das "apache2" Paket auf Ihrem System
Um das Paket auf ihrem System zu installieren nutzen sie das vorhandene Paketverwaltungssystem. Unter Debian/Ubuntu können Sie hierfür APT benutzen.

Eine genaue Funktionsbeschreibung zur Bedienung von APT finden Sie [hier](https://wiki.ubuntuusers.de/apt/apt/).

{{< collapsible label="Hinweis" >}}
  Für die Installation von apache2 mit Hilfe des Paketmanagers apt, müssen Sie das folgende Kommando ausführen:

  `apt install apache2`

Sollte es wegen fehlenden Berechtigungen während der Installation zu Problemen kommen, können Sie mit dem Zusatz **sudo** vor dem apt Kommando die benötigten Rechte erlangen.
{{< /collapsible >}}

### 2. Öffnen Sie das Installationsverzeichnis des Webservers
Unter Linux werden Softwarepakete in der Regel im **/etc** Verzeichnis in einem eigenen Ordner installiert. Nutzen Sie die bekannten Befehle, um in diesen Ordner zu gelangen.

{{< collapsible label="Hinweis" >}}
  Nutzen Sie den **cd** Befehl (Change Directory), um in das Installationsverzeichnis des Apache2 Webservers zu gelangen.

  `cd /etc/apache2`
{{< /collapsible >}}

### 3. Konfigurieren Sie den Webserver für den Port 3000
Damit Sie eine weitere Webseite über den selben Webserver ausliefern können, müssen Sie zunächst einen zweiten Port konfigurieren auf welchen der Server horchen soll. Anschließend können Sie den Port 3000 für die zweite Webseite nutzen, während die bereits vorhandene Standardseite weiterhin über den Port 80 ausgeliefert wird.

Nehmen Sie die Konfiguration der Ports in der dazugehörigen **ports.conf** Datei vor.

{{< collapsible label="Hinweis" >}}
  Öffnen Sie dafür zunächst die Datei mit Hilfe des **nano** Editors wie folgt.
  
  `nano ports.conf`

  Fügen Sie anschließend Listen 3000 in die Datei ein. Passen Sie hierbei auf, dass Sie die Zeile nicht innerhalb der dort bereits hinterlegten IF-Abfragen für HTTPS über 443 hinzufügen.
{{< /collapsible >}}

### 4. Legen Sie einen neuen Virtual Host an
Mit dem Anlegen eines neuen Virtual Hosts, signalisieren wir dem Webserver, dass er für noch eine weitere Webseite zuständig ist. Bei der Konfiguration dieses Virtual Hosts müssen wir daher dem Server mitgeben, über welchen Port die Webseite angefordert wird und wo die Dateien der Webseite im Filesystem zu finden sind (DocumentRoot).

Als Vorlage für den neuen Virtual Host können Sie die `sites-available/000-default.conf` nutzen. Ähnlich wie Sie es zuvor bei dem Nameserver getan hatten, können Sie diese Datei kopieren und anschließend wie gewünscht anpassen.

{{< collapsible label="Hinweis" >}}
  Kopieren Sie die Vorlage mit Hilfe des **cp** Kommandos wie folgt.

  `cp sites-available/000-default.conf sites-available/webseite.conf`

  Öffnen Sie die kopierte Datei mit dem nano Kommando und nehmen Sie die folgenden Anpassungen vor.

  `VirtualHost *:3000`

  `DocumentRoot /var/www/webseite`
{{< /collapsible >}}

### 5. Legen Sie das Verzeichnis der zweiten Webseite an
Soeben haben Sie bei der Konfiguration des zweiten VirtualHosts einen DocumentRoot definiert, unter welchem der Server die Dateien der Webseite, welche er ausliefern wird, findet. Dieser Ordner ist aktuell noch nicht vorhanden und auch HTML-Dateien der Webseite müssen zunächst angelegt werden.

Legen Sie nun also den Ordner `/var/www/webseite` an und erstellen Sie anschließend darin eine neue `index.html` Datei, welche standardmäßig durch den Werbserver ausgeliefert wird.

{{< collapsible label="Hinweis" >}}
  Um das neue Verzeichnis anzulegen, nutzen Sie das **mkdir** Kommando (Make Directory).

  `mkdir /var/www/webseite`

  Anschließend können Sie wie folgt eine neue Datei dort anlegen und bearbeiten.

  `touch /var/www/webseite/index.html`

  `nano /var/www/webseite/index.html`
{{< /collapsible >}}

### 6. Aktivieren Sie den VirtualHost für den Webserver
Damit der Apache2 Webserver die von Ihnen konfigurierte Webseite nun auch ausliefert, müssen Sie zunächst den dazugehörigen VirtualHost aktivieren. Eine Funktionsbeschreibung dazu finden Sie [hier](https://www.webhosterwissen.de/know-how/eigener-webserver/tutorial-apache-virtual-hosts-anlegen/).

Gucken Sie sich auch nochmal die Ordner `sites-available` und `sites-enabled` an. Es gibt eine Veränderung in diesen Verzeichnissen sobald Sie den VirtualHost aktivieren, versuchen Sie nachzuvollziehen was hierbei passiert.

{{< collapsible label="Hinweis" >}}
  Den VirtualHost können Sie mit Hilfe des folgenden Kommandos aktivieren.

  `a2ensite webseite.conf`

  Anschließend können Sie sehen, dass die Datei aus dem `sites-available` Ordner in dem `sites-enabled` Ordner verknüpft wurde. Der Webserver nutzt nur die im enabled-Ordner hinterlegten Konfigurationen, in welchem nun auch unsere zweite Webseite hinterlegt ist.
{{< /collapsible >}}

### 7. Starten Sie den Webserver neu
Durch den Neustart des Servers, werden die Konfigurationsdateien neu eingelesen, wodurch der Server im Anschluss Ihre Webseite unter dem neuen Port ausliefern wird. Sollte ein Fehler in der Konfiguration vorliegen, wird Ihnen dies beim Neustart signalisiert werden.

Neustart des Servers: `service apache2 restart`

Statusmeldung des Diensts: `service apache2 status`

### 8. Rufen Sie die Webseite im Browser auf
Nachdem Sie den Server neugestartet haben, können Sie von Ihrem Windows-System aus auf die Webseiten des Apache2 Servers zugreifen. Prüfen Sie die Funktionalität indem Sie die IP-Adresse Ihres Servers mit dem jeweiligen Port im Browser aufrufen.

`http://[IP Ihres Servers]:3000`
