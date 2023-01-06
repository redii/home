---
title: "🔥 Firewall einrichten"
date: 2020-12-29T16:34:13Z
---

Im letzten Abschnitt [🔐 Anmeldung sichern](/itadm/admin/secure-auth) haben wir bereits darüber gesprochen, dass unsere in der Cloud gemieteten Systeme **stets Gefahren aus dem Internet ausgesetzt** sind. Eine Firewall soll unsere Systeme und die darauf betriebenen Dienste zusätzlich schützen.

Im Abschnitt zum [🔎 Packet Tracer](/itadm/admin/packet-tracer) haben wir ebenfalls bereits über die Funktionsweise und den Nutzen von Firewalls gesprochen. Hier hat die **physikalische Firewall** verschiedene Subnetze voneinander abgegrenzt, um ungewollte Zugriffe zu unterbinden.

<br>

## Software Firewall
Eine Software Firewall ist ein Programm, welches auf einem Serversystem installiert werden kann. Die [Uncomplicated Firewall](https://wiki.ubuntuusers.de/ufw/) kurz **ufw** ist unter Ubuntu bereits vorinstalliert, somit also auch auf unseren gemieteten Serversystemen aus der Cloud.

Die Uncomplicated Firewall kann mit Hilfe des `ufw` Befehls aus der Kommandozeile heraus konfiguriert werden. Per default ist diese erst einmal deaktiviert und muss erstmal eingerichtet werden.

![Software Firewall](/itadm/images/firewall_software.png)

<br>

## Erste Einrichtung
Bearbeiten Sie die nächsten Schritte möglichst selbstständig und nutzen Sie wenn nötig die Hinweise. Anleitungen finden Sie auch [im Internet](https://www.google.com/search?q=ubuntu+ufw+einrichten)!

### Schritt 1 - Standardrichtlinien
> Eine Firewall arbeitet stets nach dem dem Prinzip: **block per default**. Das bedeutet man blockiert alles und lässt dann gezielt bestimmte Dienste zu.

Zunächst müssen alle eingehenden Verbindungen verboten werden.

{{<collapsible label="Hilfe">}}
```shell
$ ufw default deny incoming
$ ufw default allow outgoing
```
{{</collapsible>}}

### Schritt 2 - SSH Dienst zulassen
Damit wir uns aus unserem System nicht ausschließen, sollten wir bevor wir die Firewall aktivieren, zunächst **den OpenSSH Dienst zulassen**. Andernfalls würde der Zugriff per SSH blockiert werden und wir könnten uns nicht mehr mit dem System verbinden, da die Firewall den Zugriff nicht zulässt.

{{<collapsible label="Hilfe">}}
```shell
$ ufw allow ssh     # Den SSH Dienst freigeben
oder
$ ufw allow 22      # oder den Port 22 (Standardport für SSH) freigeben
```
{{</collapsible>}}

### Schritt 3 - Firewall aktivieren
Nachdem der SSH Dienst zugelassen wurde, kann nun die ufw aktiviert werden. Jetzt sind alle eingehenden Verbindungen (außer SSH) blockiert, wodurch die Angriffsfläche für Hacker kleiner wird.

{{<collapsible label="Hilfe">}}
```shell
$ ufw enable     # ufw aktivieren
```
{{</collapsible>}}

<br>

## Nur bestimmte IP-Adressen zulassen
Wir können nicht nur bestimmte Dienste erlauben oder verbieten, wir können auch gezielt nur bestimmte IP-Adressen für gewisse Dienste freigeben. Das kann auch in der Praxis gewollt sein, um ein hohes Maß an Sicherheit zu ermöglichen.

Ein Beispiel wäre eine Webanwendung, welche in der Cloud betrieben wird und nur aufgerufen werden darf, **wenn der User im Büro des Unternehmens sitzt**. Außerhalb des Büros soll es **sonst niemanden** möglich sein, auf diese Anwendung zuzugreifen. Hierfür kann die Firewall so konfiguriert werden, dass nur die öffentliche IP-Adresse des Internetanschlusses des Bürogebäudes auf den Webserver zugreifen darf, auf welchen die besagte Webanwendung betrieben wird.