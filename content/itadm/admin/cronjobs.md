---
title: "⏰ Cron Jobs einrichten"
date: 2020-12-31T9:22:11Z
---

Häufig kommt es vor das bestimmte Prozesse in regelmäßigen Abständen durchgeführt werden müssen. Unter Linux gibt es für diese sich wiederholenden Aufgaben die sogenannten Cron Jobs. Mit Hilfe von Cron Jobs können Befehle zu ganz genau definierbaren Zeitpunkten regelmäßig ausgeführt werden.

**Ein paar Beispiele könnten sein...**
- Jede Nacht um 2 Uhr wird ein Backup gemacht
- Alle 2 Minuten wird ein Ping auf ein System durchgeführt
- Am ersten Montag im Monat werden Daten ausgewertet
- ...

![Crontab](/itadm/images/crontab.png)

<br>

## Funktionsweise
Ein Cronjob wird durch einen sogenannten **Crontab** definiert, siehe die Grafik oben. Dieser Crontab beschreibt wann genau ein bestimmter Befehl ausgeführt werden soll. Der Befehl wird immer in Hintergrund ausgeführt! (Man sieht also nichts davon dass der Befehl ausgeführt wurde auf dem Terminal)

Er besteht aus 5 Abschnitten, wovon jeder seine eigene Bedeutung hat:
```shell
* * * * *  = Jede Minute
┳ ┳ ┳ ┳ ┳
┃ ┃ ┃ ┃ ┗━ Wochentag (0 bis 6, 0 = Sonntag)
┃ ┃ ┃ ┗━━━ Monat (1 bis 12)
┃ ┃ ┗━━━━━ Tag im Monat (1 bis 31)
┃ ┗━━━━━━━ Stunden
┗━━━━━━━━━ Minuten
```
> \* * * * * => bedeutet **jede Minute**, da überall ein Sternchen gesetzt ist. Er wird also in jeder Minute, jeder Stunde, jeden Tages, jeden Monats und jedem Wochentag ausgeführt.
>
> \* 8 * * * => bedeutet jede Minute der Stunde 8 jeden Tages, jeden Monats und jeden Wochentag ausgeführt werden. Also jeden Tag um 8.00 Uhr, 8.01 Uhr, 8.02 Uhr bis 8.59 Uhr

Cronjobs können mit Hilfe des `crontab -e` Befehls verwaltet werden. Dabei wird eine Textdatei geöffnet, in welcher Cronjobs eingetragen und verwaltet werden können. Hier ein Beispiel:
```shell
$ crontab -e

* * * * * echo "Hallo Welt" >> ~/hallo.txt
```

Der hier definierte Cron Job führt jede Minute (* * * * *) das `echo` Kommando mit dem Text "Hallo Welt" aus, welcher in die `hello.txt` geleitet wird. Das heißt der Inhalt der Datei wird über Zeit immer länger, jede Minute wird ein "Hallo Welt" angehangen.

<br>

## Regelmäßige Synchronisation von Ordnern mit rsync
Im letzten Abschnitt [🛟 Backups erstellen](/itadm/admin/backups), haben wir darüber gesprochen wie Backups von Dateien mit Hilfe von `rsync` erstellt werden können. Mit Hilfe von Cron Jobs können wir diese Backups nun automatisiert in regelmäßigen Abständen vornehmen lassen.

Probieren Sie aus die Synchronisation zwischen zwei Ordnern **mit Hilfe eines Cron Jobs minütlich** durchführen zu lassen.

{{<collapsible label="Lösung">}}
> Mit Hilfe von `crontab -e` die Konfigurationsdatei öffnen und den folgenden Cron Job Eintrag hinzufügen...
```shell
$ crontab -e

* * * * * rsync -av dir1/ dir2
```

Nun sollte jede Minute der `dir1` mit dem `dir2` Ordner synchronisiert werden, sodass beide fortlaufend auf dem selben Stand sind. Probieren Sie es aus!
{{</collapsible>}}