---
title: "Kapitel 10 - Softwarepakete verwalten"
date: 2020-12-26T18:07:46Z
draft: false
---

| Kommando      | Funktion      |
| ------------- | ------------- |
| `apt install <Paket>` | Installiert das angegebene Paket. |
| `apt remove <Paket>` | Deinstalliert das angegebene Paket. |
| `printenv` | Gibt alle definierten Umbungebunsvariablen aus. |

## Aufgabe 1

Installieren Sie das **apache2** Paket auf Ihrem System. 

Überprüfen Sie ob das Paket installiert wurde indem Sie auf die Default-Webseite auf Ihrem Server zugreifen. Rufen Sie dafür die URL Ihres Servers im Browser auf.

## Aufgabe 2
Im Abschnitt **Filesystem und Ordnerstruktur** hatten wir bereits darüber gesprochen, wo Konfigurationsdateien für verschiedene Pakete abgelegt werden.

Finden Sie heraus, wo genau die Konfigurationsdateien des Apache2 Servers liegen und gehen Sie sicher, dass diese auch vorhanden sind.

## Aufgabe 3
Deinstallieren Sie das Apache2 Paket von Ihrem System. Prüfen Sie ob der Webserver deinstalliert wurde, indem Sie erneut versuchen die Webseite aufzurufen.

Prüfen Sie zudem was mit den Konfigurationsdateien passiert ist. Finden Sie herraus wie auch die Konfigurationsdateien mit Hilfe von `apt` deinstalliert bzw. gelöscht werden können.
