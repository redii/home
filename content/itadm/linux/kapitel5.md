---
title: "Kapitel 5 - Umgang mit Texteditoren"
date: 2020-12-26T14:48:48Z
draft: false
---

| Kommando      | Funktion      |
| ------------- | ------------- |
| `cat <Pfad>` | Gibt den Inhalt einer Datei aus. |
| `touch <Dateiname>` | Erstellt eine neue Datei. |
| `vim <Pfad>` | Öffnet eine Datei im vim Editor. |
| `nano <Pfad>` | Öffnet eine Datei im nano Editor. |

- vim
  - `esc`: Befehlsmodus
  - `i`: Eingabemodus
- nano
  - `Strg+O`: Datei speichern
  - `Strg+X`: Datei schließen

## Aufgabe 1
Erstellen Sie eine Datei in Ihrem Homeverzeichnis und öffnen Sie diese anschließend im `vim` Editor. Befüllen Sie diese Datei nun mit einem beliebigen Text Ihrer Wahl.

Speichern und schließen Sie die Datei und lassen Sie sich im Anschluss den Inhalt im Terminalfenster mit Hilfe des `cat` Kommandos ausgeben.

## Aufgabe 2
Wiederholen Sie nun die Aufgabe 1, sodass Sie am Ende zwei unterschiedliche Dateien erstellt haben. Nutzen Sie dieses Mal allerdings statt des `vim` den `nano` Editor.

## Aufgabe 3
Recherchieren und testen Sie wofür die folgenden Kommandos im vim Editor benutzt werden:

- h, j, k, l
- dd
- /
- 0
- ZZ

## Aufgabe 4
Recherchieren Sie, wie Sie zwei Dateien zeitgleich im `vim` Editor öffnen und bearbeiten können. Nutzen Sie zum testen die in Aufgabe 1 und 2 erstellten Dateien.

## Aufgabe 5
Recherchieren Sie was die “Message of the day” oder auch "motd" im Linux Kontext ist.

Nutzen Sie im Anschluss einen der Editoren, um eine solche Message zu definieren. Sollten Sie **nicht** als root Benutzer arbeiten, müssen Sie das `sudo ` Kommando voranstellen um es als Admininstrator auszuführen.
