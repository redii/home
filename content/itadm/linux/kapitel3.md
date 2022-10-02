---
title: "Kapitel 3 - Besondere Dateien"
date: 2020-12-26T13:54:46Z
draft: false
---

| Kommando      | Funktion      | Flags |
| ------------- | ------------- | ----- |
| `cat <Dateipfad>` | Gibt den Inhalt einer Datei im Terminal aus. | |
| `touch <Dateipfad>` | Erstellt eine Datei unter dem angegebenen Pfad. | |
| `ls` | Zeigt Ihnen den Inhalt des Ordners in dem Sie sich gerade befinden. | `-l` Ausgabe als Liste |
| `ln <Quellpfad> <Zielpfad>` | Erstellt einen Link der Quelldatei unter dem Zielpfad. | `-s` für einen Soft-Link |
| `man <Kommando>` | Gibt ein Handbuch zum angegebenen Kommando aus. | |

Führen Sie vor der Bearbeitung folgendes Kommando aus:

`wget akmnn.de/itadm/artikel.txt; wget akmnn.de/itadm/.secret;`

Dadurch werden die Dateien `artikel.txt` und `.secret` auf Ihr System in das aktuelle Arbeitsverzeichnis heruntergeladen.

## Aufgabe 1
Lassen Sie sich den Inhalt der `artikel.txt` Datei mit Hilfe des `cat` Kommandos ausgeben. 

## Aufgabe 2
In Ihrem Arbeitsverzeichnis liegt zudem die `.secret` Datei, können Sie sie sehen? Wenn nicht, können Sie sich den Inhalt ausgeben lassen?

Finden Sie mit Hilfe des `man` Kommandos heraus, wie sie sich diese Dateien ebenfalls im Verzeichnis anzeigen lassen können.

## Aufgabe 3
Erstellen Sie einen neuen Ordner "linktest" in Ihrem Homeverzeichnis und legen Sie anschließend einen Hard- sowie einen Softlink zu der `artikel.txt` Datei in diesem Ordner an.

Prüfen Sie die Funktionalität der beiden Links, in dem Sie sich den Inhalt der `artikel.txt` Datei mit Hilfe dieser ausgeben lassen.

## Aufgabe 4
Löschen oder verschieben Sie nun die `artikel.txt` Datei.

Was ist jetzt mit den Links passiert? Recherchieren Sie die Funktionsweise von Hard- und Softlinks.