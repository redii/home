---
title: "Kapitel 6 - Datenströme steuern"
date: 2020-12-26T15:00:59Z
draft: false
---

| Kommando      | Funktion      | Flags |
| ------------- | ------------- | ----- |
| `echo <Text>` | Gibt einen Text standardmäßig im Terminalfenster aus. | |
| `cat <Pfad>` | Gibt den Inhalt einer Datei im Terminalfenster aus. | |
| `sort` | Sortiert eine Eingabe. | `-n` Alphanumerische Sortierung |

## Aufgabe 1
Erstellen Sie eine neue Textdatei indem Sie die Standardausgabe eines Kommandos umleiten. Hierfür können Sie jedes Ihnen bekannte Kommando nutzen.

Prüfen Sie, ob die Ausgabe erfolgreich umgeleitet wurde, indem Sie den Inhalt der Datei mit Hilfe des `cat` Kommandos ausgeben lassen.

## Aufgabe 2
Leiten Sie nun auch die Standardfehlerausgabe in eine neue Datei um. 

Damit hierbei auch etwas umgeleitet wird, müssen Sie nun einer Fehler provozieren, wessen Ausgabe dann in die angegebene Datei umgeleitet wird. 

## Aufgabe 3
Leiten Sie erneut die Ausgabe eines Programms in die selbe Datei um, jedoch überschreiben Sie die bisherigen Daten nicht sondern hängen Sie die neuen hinten an. 

Prüfen Sie auch hier die Verarbeitung der Daten.

## Aufgabe 4
Führen Sie das folgende Kommando aus:

`apt install -y cowsay fortune-mod`

Dadurch wurden zwei zusätzliche Pakete `cowsay`und `fortune` auf Ihrem System installiert, welche Sie nun in der Kommandozeile nutzen können.

Testen Sie die Kommandos und versuchen Sie abschließend die Ausgabe des `fortune` Kommandos in das `cowsay` Kommando umzuleiten.
