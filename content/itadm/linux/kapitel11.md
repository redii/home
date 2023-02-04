---
title: "Kapitel 11 - Umgang mit Berechtigungen"
date: 2020-12-26T18:23:55Z
draft: false
---

| Kommando      | Funktion      |
| ------------- | ------------- |
| `adduser <Name>` | Erstellt einen neuen Benutzer. |
| `userdel <Name>` | Löscht den angegebenen Benutzer. |
| `su <Name>` | Ummelden auf den angegebenen Benutzer. |
| `whoami` | Gibt den eigenen Benutzernamen aus. |
| `chmod <Rechte> <Datei>` | Passt die Berechtigungen einer Datei an. |
| `chown <Benutzer> <Datei>` | Macht den angegeben Benutzer zum Inhaber der Datei. |

### Benutzerklassen
- u = User (Inhaber)
- g = Group (Gruppe)
- o = Others (Andere)

### Rechte
- r = Read = Lesen
- w = Write = Schreiben
- x = Execute = Ausführen

## Aufgabe 1
Erstellen Sie einen neuen Benutzer auf Ihrem System und loggen Sie sich anschließend auf diesen um.

Überprüfen Sie die Ummeldung mit Hilfe des `whoami` Kommandos.

## Aufgabe 2
Erstellen Sie im Home Verzeichnis des neuen Benutzers eine Textdatei, welche Sie mit einem beliebigen Inhalt füllen. 

Gucken Sie sich zunächst die Berechtigungen nach dem Erstellen an und definieren Sie im Anschluss, dass niemand außer dem Besitzer und der Gruppe diese Datei lesen darf.

## Aufgabe 3
Verschieben Sie die Datei nun in den `/tmp` Ordner wo Sie für alle Benutzer des Systems sichtbar ist.

Erstellen Sie einen weiteren Benutzer und loggen Sie sich als dieser um. Versuchen Sie nun den Inhalter der im `/tmp` Ordner liegende Datei auszugeben.