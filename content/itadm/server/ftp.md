---
title: "Fileserver"
date: 2020-12-20T19:50:56Z
draft: false
---

# Installation und Konfiguration - vsftpd

unter Ubuntu 20.04 LTS

## 🚀 Ziel der Aufgabe

Die Aufgabe besteht darin einen FTP-Server auf Ihrem System zu installieren und anschließend zu konfigurieren. Am Ende sollten Sie per FTP auf das Filesystem Ihres Servers zugreifen können, um Dateien und Verzeichnisse verwalten zu können.

Außerdem sollten Sie auch das **SFTP** Protokoll nutzen, um eine einfache und sichere Alternative zur Datenübertragung kennenzulernen.

## 1. Installieren Sie das "vsftpd" Paket auf Ihrem System

Um das Paket auf ihrem System zu installieren nutzen sie das vorhandene Paketverwaltungssystem. Unter Debian/Ubuntu können Sie hierfür APT benutzen.

Eine genaue Funktionsbeschreibung zur Bedienung von APT finden Sie [hier](https://wiki.ubuntuusers.de/apt/apt/).

{{< collapsible label="Hinweis" >}}
Für die Installation von **vsftpd** mit Hilfe des Paketmanagers **apt**, müssen Sie das folgende Kommando ausführen:

`apt-get install vsftpd`

Sollte es wegen fehlenden Berechtigungen während der Installation zu Problemen kommen, können Sie mit dem Zusatz `sudo` vor dem apt Kommando die benötigten Rechte erlangen.
{{< /collapsible >}}

## 2. Konfigurieren Sie das Verhalten des FTP-Servers

Bevor Sie über den Fileserver auf das System zugreifen können, müssen Sie zunächst Konfigurationen vornehmen. Zum Beispiel ist das Schreiben bzw. Verändern von Daten auf dem Server per FTP standardmäßig verboten und muss daher zunächst freigegeben werden.

Anders als bei den bisherigen Serverarten finden Sie die Konfigurationsdatei des vsftpd direkt unter **/etc/vstfpd.conf**. In dieser Datei müssen Sie nun den Parameter **WRITE_ENABLE** auf **YES** setzen.

{{< collapsible label="Hinweis" >}}
Öffnen Sie die Datei zunächst mit dem folgenden Kommando.

`nano /etc/vsftpd.conf`

Suchen Sie in dieser Datei den oben genannten Parameter und setzen Sie diesen auf den Wert **YES**. Achten Sie hierbei darauf, dass die jeweilige Zeile nicht durch ein **#** auskommentiert wurde.
{{< /collapsible >}}

## 3. Aktivieren Sie den Zugriff durch den Root-User

Aufgrund der Tatsache, dass der Root-User uneigenschränkten Zugriff auf den Server hat und somit erheblichen Schaden anrichten könnte, hat diese standardmäßig keinen Zugriff auf das System per FTP.

Damit wir uns nun testweise mit dem Server verbinden können, erlauben wir in diesem Schritt dem Root-User jedoch die Verbindung per FTP. Entfernen Sie daher root aus der zum Server gehörenden Datei **/etc/ftpusers**.

Starten Sie den Server anschließend neu, damit die Änderungen übernommen werden.

{{< collapsible label="Hinweis" >}}
Öffnen Sie die Datei zunächst mit dem folgenden Kommando.

`nano /etc/ftpusers`

In dieser Datei befindet sich eine Liste mit Usern des Systems, welche für den Zugriff per FTP ausgeschlossen sind. Damit der Root-User sich nun also verbinden kann, müssen Sie Ihn aus dieser Liste entfernen.

Neustart des Servers: `service vsftpd restart`

Statusmeldung des Diensts: `service vsftpd status`
{{< /collapsible >}}

## 4. Verbinden Sie sich per FTP als Root-User

Um sich mit dem Server per FTP zu verbinden, benötigen Sie zunächst eine entsprechende Client-Software. Ich empfehle Ihnen hierbei das Programm WinSCP, welches Sie hier herunterladen können.

Installieren Sie das Programm und verbinden Sie sich anschließend mit dem Server als Root-User per FTP.

![WinSCP Anmeldung per FTP](/itadm/winscp.png)

## 5. Legen Sie zusätzliche Benutzer an

Aufgrund der Tatsache, dass der FTP-Server Systemuser für die Authentifizierung bei Nutzung des Dienstes einsetzt, können Sie einfach einen zusätzlichen Benutzer unter dem Betriebssystem anlegen.

Verbinden Sie sich anschließend mit dem neu angelegten Benutzer. Merken Sie einen Unterschied zur vorherigen Anmeldung als Root-User?

{{< collapsible label="Hinweis" >}}
Um einen neuen Systemuser anzulegen nutzen Sie das folgende Kommando.

`adduser [Name des Benutzers]`

Öffnen Sie in WinSCP anschließend eine neue Verbindung und nutzen Sie den gerade angelegten User zur Authentifizierung gegen den FTP-Server.
{{< /collapsible >}}

## 6. Verbinden Sie sich per SFTP auf den Server
Öffnen Sie eine neue Verbindung zu Ihrem Server, dieses Mal allerdings mit Hilfe des Protokolls SFTP.

Was ist Vorraussetzung für die Nutzung von SFTP? Bemerken Sie Unterschiede in der Nutzung?

![WinSCP Anmeldung per SFTP](/itadm/winscp2.png)

## 7. Webseite mit GUI anpassen
Nachdem Sie sich per FTP oder SFTP auf den Server verbunden haben, können Sie auch die Dateien aus der vorherigen Aufgaben nun mit einem grafischen Texteditor einsehen. Navigieren Sie dafür in einen der Ordner, machen Sie einen Rechtsklick auf die gewünschte Datei und drücken anschließend auf `Editieren > Editieren mit...`.

Sie können bspw. die index.html Datei der neu erstellten Webseite unter `/var/www/webseite/index.html` anpassen und nach dem Speichern der Datei, die Änderungen unmittelbar auf Ihrer Webseite ansehen.

