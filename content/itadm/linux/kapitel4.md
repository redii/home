---
title: "Kapitel 4 - Logik und Wildcards"
date: 2020-12-26T14:18:17Z
draft: false
---

| Kommando      | Funktion      | Flags |
| ------------- | ------------- | ----- |
| `date` | Gibt das aktuelle Datum aus. | `+<Format>` definiert Ausgabeformat |
| `find [Suchbegriff]` | Sucht nach Dateien und Ordnern. | |
| `mkdir <Ordnerpfad>` | Legt einen neuen Ordner unter dem angegebenen Pfad an. | |
| `du <Pfad>` | Gibt den Speicherverbraucht von Dateien und Verzeichnissen aus. | `-d` definiert Suchtiefe |

## Aufgabe 1
Lassen Sie sich mit Hilfe des `echo` Kommandos einen Text ausgeben in dem das aktuelle Datum untergebracht ist. Bspw. “Heute ist der 01.01.1970”

Nutzen Sie dafür die `$()` Schreibweise, um das `date` Kommando im Eingabetext des echos unterzubringen.

## Aufgabe 2
Legen Sie mehrere Dateien mit unterschiedlichen Dateiendungen (.txt/.csv/.pdf) in Ihrem Homeverzeichnis an. Folgende Struktur sollte nun vorzufinden sein:

```
.
├── datei1.txt
├── datei2.txt
├── datei3.csv
├── datei4.csv
├── datei5.pdf
└── datei6.pdf
```

Versuchen Sie sich anschließend mit dem `find` Kommando, Dateien eines bestimmten Dateityps z.B. alle **.txt** Dateien ausgeben zu lassen. Nutzen Sie hierfür die gerade besprochenen Wildcards.

## Aufgabe 3
Lassen Sie sich den Speicherverbrauch der Ordner unterhalb des Root-Verzeichnisses `/` ausgeben. In welcher Einheit sind die Werte der Speicherbelegung angegeben? 

Finden Sie heraus wie Sie die Werte lesbar umrechnen lassen können.