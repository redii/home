---
title: "Kapitel 7 - Komplexe Pipe Operationen"
date: 2020-12-26T15:14:04Z
draft: false
---

| Kommando      | Funktion      | Flags |
| ------------- | ------------- | ----- |
| `cat <Pfad>` | Gibt den Inhalt einer Datei im Terminalfenster aus. | |
| `grep <Suchmuster>` | Sucht nach dem angegebenen Muster in einer Eingabe. | `-i` Case insensitive |
| `cut` | Sucht nach dem angegebenen Muster in einer Eingabe. | `-i` Case insensitive |
| `sort` | Unterteil eine Eingabe in Spalten anhand eines Trennzeichens. | `-d<Zeichen>` Definiert das Trennzeichen <br>`-f<Zahl>` Definiert die Ausgabespalte |

## Aufgabe 1
Erstellen Sie ein Verzeichnis `greptest/` und darin die folgenden Dateien:

```
datei1.txt
datei2.txt
datei3.pdf
datei4.pdf
datei5.csv
datei6.csv
```

Achten Sie auf die Dateiendungen.

Lassen Sie sich im Anschluss den Inhalt des `greptest` Ordners mit Hilfe des `ls` Kommandos ausgeben. Verarbeiten Sie die Ausgabe so, dass nur .txt Dateien ausgeben werden. Nutzen Sie hierfür den Pipe Operator sowie `grep`.

## Aufgabe 2
Kopieren Sie sich die `/etc/passwd` Datei in Ihr Homeverzeichnis. Gucken Sie sich nun die Datei einmal genauer an, erkennen Sie ein Muster?

Nutzen Sie das `cut` Kommando, um sich die Spalte mit den Pfaden des jeweiligen Homeverzeichnisses im Terminalfenster ausgeben. 

## Aufgabe 3
Lassen Sie sich nun die 3. Spalte mit den Benutzer-IDs ausgeben. Die Zahlen sind jedoch nicht sortiert… Sortieren Sie diese mit dem `sort` Kommando sowie dem Pipe Operator.
