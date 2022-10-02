---
title: "Kapitel 2 - Bewegen in der Ordnerstruktur"
date: 2020-12-26T13:26:31Z
draft: false
---

| Kommando      | Funktion      | Flags |
| ------------- | ------------- | ----- |
| `ls` | Zeigt Ihnen den Inhalt des Ordners in dem Sie sich gerade befinden. | `-l` Ausgabe als Liste |
| `cd [Pfad]` | Bewegen Sie sich zum angegebenen Ordner. | |
| `mkdir <Ordnerpfad>` | Legt einen neuen Ordner unter dem angegebenen Pfad an. | |
| `cp <Quellpfad> <Zielpfad>` | Kopiert eine Datei. | `-r` Kopiert rekursiv. |
| `mv <Quellpfad> <Zielpfad>` | Bewegt eine Datei. | |
| `rm <Pfad>` | Löscht eine Datei. | `-r` Löscht rekursiv. |
| `man <Kommando>` | Gibt ein Handbuch zum angegebenen Kommando aus. | |

## Aufgabe 1
In der Kommandozeile wird Ihnen stets dargestellt, in welchem Arbeitsverzeichnis (Ordner) Sie sich gerade befinden. 

Geben Sie zu Beginn die Kommandos `cd` und `ls` wie folgt ein:

```bash
root@192.0.2.42:~$ cd /
root@192.0.2.42:/$ ls -l
total 64
lrwxrwxrwx   1 root root     7 Sep  2 21:38 bin
drwxr-xr-x   4 root root  4096 Dec 14 06:10 boot
drwxr-xr-x  16 root root  3820 Dec 22 20:26 dev
drwxr-xr-x  93 root root  4096 Dec 17 15:46 etc
drwxr-xr-x   4 root root  4096 Dec 17 15:50 home
...
```

Durch `cd /` haben sie den Root-Ordner `/` betreten und haben anschließend mit Hilfe von `ls -l` den Inhalt des Ordners ausgegeben. Bewegen Sie sich nun selbstständig durch die Ordnerstruktur und schauen Sie sich ein wenig um.

## Aufgabe 2
Was passiert wenn Sie das `cd` Kommando ohne einen Pfad anzugeben ausführen? Probieren Sie es aus.

## Aufgabe 3
Führen Sie das Kommando cd .. aus. Was ist gerade passiert? Recherchieren Sie die Funktion der “.” und “..” Ordnern und wie Sie sie benutzen können.

## Aufgabe 4
Stellen Sie sicher, dass Sie in Ihrem persönlichen Homeverzeichnis sind:

❌ /home

✅ /home/benutzername

✅ /root (sollten Sie als Root-Benutzer arbeiten)

Erstellen Sie nun einen neuen Ordner in Ihrem Homeverzeichnis mit dem Namen "test". Kopieren Sie anschließend die `/etc/passwd` Datei in den gerade erstellten Ordner.

## Aufgabe 5
Durch Aufgabe 4 sollte nun die folgende Struktur in Ihrem Homeverzeichnis vorliegen.

```
.
└── test
    └── passwd
```

Probieren Sie nun aus den angelegten Ordner "test" mit seinem Inhalt zu löschen. Recherchieren Sie wofür das `-r` Flag bei dem `rm` Kommando genutzt wird.
