---
title: "SSH-Server - OpenSSH"
date: 2024-03-14T08:32:22Z
---

# Nutzung von SSH und SFTP

unter Ubuntu 20.04 LTS

## 🚀 Ziel der Aufgabe
Sie sollen sich mit der Kommandozeile des von mir bereitgestellten Servers in der Cloud verbinden. Nutzen Sie hierfür das SSH Protokoll und die von mir bereitgestellten Zugangsdaten.

Anschließend sollen Sie sich mit Hilfe des SFTP Protokolls auf den Server verbinden und testweise eine Datei auf diesen hochladen.

## 1. Zugriff per SSH
Nutzen Sie das SSH Protokoll um sich mit dem Server zu verbinden. Wie zuvor in den Folien gezeigt, können Sie hierfür das `ssh` Kommando verwenden.

{{<collapsible label="Hinweis">}}
Für die Verbindung zum Server benötigen Sie die IP-Adresse des Servers und das Passwort des root Benutzers.

```
ssh root@<IP-Adresse>
Are you sure you want to continue connecting (yes/no)? yes
Password: <Passwort>
```
{{</collapsible>}}

## 2. Kommandos auf dem Server
Nachdem Sie sich erfolgreich mit dem Server verbunden haben, können Sie nun einige Kommandos auf dem Server ausführen.

Testen Sie ein paar der Ihnen bekannten Kommandos aus der Linux/Unix Vorlesung, um sich mit dem System vertraut zu machen.

## 3. SFTP Client installieren
Nun sollen Sie sich mit dem SFTP Protokoll auf den Server verbinden. Hierfür benötigen Sie einen SFTP Client. Installieren Sie den Client Ihrer Wahl auf Ihrem System. Sie können hierfür z.B. `FileZilla` oder `WinSCP` verwenden.

- [WinSCP Download](https://winscp.net/eng/download.php)
- [Filezilla Download](https://filezilla-project.org/download.php?platform=win64)
- Für Mac-User: [Cyberduck Download](https://cyberduck.io/download/)

## 4. Zugriff per SFTP
Nachdem Sie sich mit der Kommandozeile des Linux-Systems verbunden haben, können Sie nun per SFTP auf die Ordnerstruktur dieses Linux-Systems mit Hilfe einer grafischen Oberfläche zugreifen.

Verbinden Sie sich mit dem Server mit Hilfe der gerade installieren Client-Software und laden Sie eine Testdatei auf diesen hoch.

{{<collapsible label="Hinweis">}}
Starten Sie die gerade installierten Software und wählen Sie die Option `Neue Verbindung`. 

Achten Sie darauf, dass Sie den Verbindungstyp auf `SFTP` stellen.

Geben Sie anschließend die IP-Adresse des Servers, den Benutzernamen `root` und das Passwort ein und klicken Sie auf `Verbinden`.
{{</collapsible>}}