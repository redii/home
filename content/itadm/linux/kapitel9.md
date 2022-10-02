---
title: "Kapitel 9 - Arbeiten mit der PATH Variable"
date: 2020-12-26T17:59:31Z
draft: false
---

| Kommando      | Funktion      |
| ------------- | ------------- |
| `which <Programm>` | Gibt den Pfad eines Programms aus. |
| `type <Befehl>` | Gibt die Art bzw. Herkunft eines Befehls aus. |
| `printenv` | Gibt alle definierten Umbungebunsvariablen aus. |

## Aufgabe 1

Finden Sie mit Hilfe des `which` Kommandos heraus, wo genau die Binärdatei des `cat` Programms abgelegt ist. 

Nutzen Sie im Anschluss diese Binärdatei direkt (nutzen Sie den Pfad statt einfach nur cat einzugeben), um den Inhalt einer Textdatei auszugeben.

## Aufgabe 2

Führen Sie zunächst den folgenden Befehl aus:

`wget akmnn.de/itadm/hello; chmod +x hello;`

Dadurch haben Sie eine Skriptdatei heruntergeladen, welche Sie nun ausführen können. Sie können die Datei aufrufen indem Sie eine Pfadangabe in den Terminal schreiben. 

Wenn Sie sich im selben Ordner wie das Skript befinden können Sie es wie folgt aufrufen: `./hello`. Aktuell ist dies nur unter der Angabe des Pfades der Skriptdatei möglich.

## Aufgabe 3

Legen Sie nun einen neuen Ordner `bin` in Ihrem Homeverzeichnis an und verschieben Sie die `hello` Datei in diesen.

Erweitern Sie die **PATH** Variable nun so, dass auch Programme aus dem gerade angelegten Ordner mit einbezogen werden. Prüfen Sie die Funktionalität indem Sie das Programm im Anschluss ohne Angabe des Pfades ausführen.