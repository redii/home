---
title: "Nameserver"
date: 2020-12-15T16:32:22Z
draft: false
---

# Installation und Konfiguration - bind9

unter Ubuntu 20.04 LTS

## 🚀 Ziel der Aufgabe

Die Aufgabe besteht darin einen Bind Nameserver auf Ihrem System zu installieren und anschließend zu konfigurieren. Das grobe Ziel ist dass Ihr Server für eine Domain zuständig ist und die DNS-Einträge für diese verwaltet.

Beispielsweise können Sie die Domain **itadm.de** für Ihren Server hinterlegen und anschließend DNS-Einträge wie **www**.itadm.de für diese definieren. Am Ende sollen Sie eine manuelle Namensauflösung Ihrer konfigurierten Domain gegen den Server vornehmen und eine IP-Adresse zurück erhalten. Zum Beispiel die Adresse 1.2.3.4 bei der Auflösung von www.itadm.de.

## 1. Installieren Sie das "bind9" Paket auf Ihrem System

Um das Paket auf ihrem System zu installieren nutzen sie das vorhandene Paketverwaltungssystem. Unter Debian/Ubuntu können Sie hierfür APT benutzen.

Eine genaue Funktionsbeschreibung zur Bedienung von APT finden Sie [hier](https://wiki.ubuntuusers.de/apt/apt-get/).

{{< collapsible label="Hinweis" >}}
  Für die Installation von **bind9** mit Hilfe des Paketmanagers **apt**, müssen Sie das folgende Kommando ausführen:

  `apt-get install bind9`

  Sollte es wegen fehlenden Berechtigungen während der Installation zu Problemen kommen, können Sie mit dem Zusatz `sudo` vor dem apt Kommando die benötigten Rechte erlangen.
{{< /collapsible >}}

## 2. Öffnen Sie das Installationsverzeichnis des Bind Servers

Unter Linux werden Softwarepakete in der Regel im **/etc** Verzeichnis in einem eigenen Ordner installiert. Nutzen Sie die bekannten Befehle, um in diesen Ordner zu gelangen.

{{< collapsible label="Hinweis" >}}
  Nutzen Sie den cd Befehl (Change Directory), um in das Installationsverzeichnis des Bind Servers zu gelangen.

  `cd /etc/bind`
{{< /collapsible >}}

## 3. Konfiguration des Servers

Im Installationsverzeichnis finden Sie verschiedene Ordner und Dateien. Darunter auch verschiedene Konfigurationsdateien, welche unter der named.conf durch includes zusammengeführt werden. Jede dieser Dateien hat daher eine eigene Funktion.

Nehmen Sie die folgenden Konfigurationen am grundlegen Serververhalten in der passenden Konfigurationsdatei vor. Welche könnte dies sein?

```
recursion yes;

forwarders {
  8.8.8.8;
  8.8.4.4;
};

allow-query {
  any;
};
```

{{< collapsible label="Hinweis" >}}
Die Konfigurationsdatei wurde in mehrere Teile gesplittet, um diese logisch voneinander zu trennen und somit eine Ordnung zu schaffen. Beim einlesen der named.conf werden dann die Teildateien wieder in eine inkludiert.

Die Kofiguration der Grundlegenden Funktionsweise wird bei dieser Aufteilung in der "named.conf.options" vorgenommen. Öffne nen Sie diese mit Hilfe von nano.

`nano /etc/bind/named.conf.options`

`recursion yes;` Erlaubt rekursives Auflösen von Domains für einen Client.

`forwarders { 8.8.8.8; 8.8.4.4; };` Der Server leitet Anfragen für die er selber keine Lösung kennt, an den Google DNS Service weiter.

`allow-query { any; };` Erlaubt Anfragen von jedem System bzw. jeder Source IP-Adresse.
{{< /collapsible >}}

## 4. Legen Sie eine neue Zone auf dem Server an

Um eine neue Zone bzw. Domain zu definieren, müssen Sie diese in der dafür vorgesehenden Konfugurationsdatei hinterlegen. Für die Zone können Sie im Anschluss DNS-Einträge definieren, welche dann durch den Server selbst aufgelöst werden können.

Achten Sie darauf den Fully Qualified Domain Name (FQDN) für die Konfiguration zu nutzen.

Eine genauere Anleitung zur Registrierung einer neuen Zone finden Sie Sie [hier](https://help.ubuntu.com/community/BIND9ServerHowto#Primary_Master_Server_configuration).

{{< collapsible label="Hinweis" >}}
Eine neue Domain bzw. Zone kann in der named.conf.local vorgenommenwerden.

`nano /etc/bind/named.conf.local`

```
zone "itadm.de." {
  type master;
  file "/etc/bind/db.itadm.de";
};
```
{{< /collapsible >}}

## 5. Erstellen Sie die dazugehörige Zonendatei

Bei der Konfiguration der Zone haben Sie soeben den Pfad einer Zonendatei angegeben, welche Sie nun erstellen müssen. In dieser Zonendatei werden die DNS-Einträge bzw. Ressource Records hinterlegt, welche in IP-Adressen o.ä. aufgelöst werden können.

Sie können die leere Templatedatei **db.empty** als Vorlage nutzen. Hinterlegen Sie in der neu angelegten Datei anschließend einen Eintrag für die Domain **www.itadm.de** auf eine beliebige IPv4 Adresse.

{{< collapsible label="Hinweis" >}}
Kopieren Sie die db.empty Datei mit Hilfe des folgenden Kommandos (Copy).

`cp db.empty db.itadm.de`

Öffnen Sie die kopierte Datei anschließend und nehmen Sie die benötigten Konfigurationen vor.

`nano db.itadm.de`

![DNS Zonendatei Vorlage](/itadm/dns_zone.png)
{{< /collapsible >}}

## 6. Starten Sie den Server neu

Damit Ihre gerade vorgenommenen Konfigurationen berücksichtigt werden, müssen Sie den Server zunächst erst einmal neustarten. Dabei werden die Konfigurationsdateien des Servers neu eingelesen und Ihre Änderungen eingespielt.

Überprüfen Sie ob der Server erfolgreich neugestartet wurden, indem Sie auch den Status des Diensts prüfen. Führen Sie dafür die folgenden Kommandos aus.

Neustart des Servers: `service bind9 restart`

Statusmeldung des Diensts: `service bind9 status`

## 7. Nutzen Sie den Server für eine Namensauflösung
Um den Server abschließend zu prüfen, können Sie die konfigurierte Domain bzw. den dafür hinterlegten DNS-Eintrag manuell abfragen. Wechseln Sie hierfür zurück in Ihr Windows-System und starten Sie von hier aus eine manuelle Namensauflösung.

Was dabei passiert: Ihr Windows-Rechner spricht Ihren Server über das Internet an und fragt nach der Auflösung der Domain **www.itadm.de**. Ihr Nameserver sollte dann mit der gerade konfigurierten IP-Adresse antworten. Führen Sie für die manuelle Namensauflösung in der Windows-Kommandozeile folgendes Kommando aus.

Manuelle Namensauflösung: `nslookup www.itadm.de [IP Ihres Servers]`
