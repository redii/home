---
title: "🔐 Sichere Anmeldung per SSH"
date: 2020-12-29T11:42:23Z
---

Die Serversysteme, welche wir in der Cloud gemietet haben, stehen **transparent im Internet** und sind somit weltweit für jeden erreichbar. Dadurch sind die Systeme aber auch **potenziell gefährdet**, denn jeder kann die Systeme ungefiltert angreifen.

Der erste Dienst, welcher für einen sicheren Betrieb unseres Systems abgesichert werden muss, ist der **OpenSSH Server**. Der OpenSSH Server ist auf unserem System **bereits vorinstalliert** und bietet uns die Möglichkeit auf die Kommandozeile aus der Ferne zuzugreifen. Das macht den Dienst natürlich auch **attraktiv für Angreifer**, um die Kontrolle über das System zu übernehmen.

![Authentication Attacks](/itadm/images/auth_attacks.png)

<br>

### 🚨 Gefahr - Bruteforce Attacken
Sogenannte Bruteforce Attacken sind die wahrscheinlich einfache Art und Weise eine Authentifizierung anzugreifen. Beim Bruteforce werden automatisiert alle möglichen Passwörter ausprobiert, bis das richtige gefunden wurde.

#### Aufgabe - Fail2Ban einrichten
Eine Möglichkeit wie solche Bruteforce Angriffe weitestgehend unterbunden werden können, ist die Software `Fail2Ban`. Recherchieren Sie, wie die Software das System gegen Bruteforce Angriffe schützt und installieren Sie es auf Ihrem System.

{{<collapsible label="Lösung">}}
```shell
$ apt update
$ apt install fail2ban
```
{{</collapsible>}}

<br>

### 🚨 Gefahr - Anmeldung als root
Zunächst gibt es auf unserem System nur einen `root` Benutzer, mit welchem wir uns auf dem System anmelden können. Der root Benutzer ist der Administrator und hat damit alle Rechte zur Verwaltung des Systems, wodurch er sehr interessant für Hacker ist. Außerdem ist auf jedem Linux System ein root User vorhanden, wodurch Angreifer wissen, dass sie diesen Zugang angreifen können.

#### Aufgabe - Anmeldung als root verbieten
Eine erste Vorkehrung ist die direkte Anmeldung per SSH mit dem root Benutzer zu verbieten, dadurch können Angreifer aus dem Internet nicht einfach das root Konto angreifen. 

Dafür muss zunächst **ein neuer Benutzer** angelegt werden über welchen man sich anschließend mit dem System verbinden kann. Anschließend **verbieten Sie dem root Benutzer die Anmeldung per SSH**.  
Eine Anleitung dafür finden Sie [im Internet](https://www.google.com/search?q=ubuntu+ssh+root+login+verbieten)!

Prüfen Sie anschließend, ob der Login mit dem root Benutzer tatsächlich nicht mehr funktioniert und melden Sie sich stattdessen mit Ihrem neu erstellten Benutzer an.

{{<collapsible label="Lösung">}}
##### Neuen Benutzer anlegen
```shell
$ adduser akmann             # Neuen Benutzer anlegen
  ...                        # den Dialog durchklicken
$ usermod -aG sudo akmann    # Ggf. den neuen Benutzer zu sudo Gruppe hinzufügen
```

##### Root Login verbieten
```shell
$ nano /etc/ssh/sshd_config  # Konfigurationsdatei des OpenSSH Servers öffnen

Die Datei wie folgt anpassen:
PermitRootLogin no           # Root Login verbieten
AllowUsers akmann            # Login für neuen Benutzer erlauben

$ service ssh restart       # Server neustarten
```
{{</collapsible>}}

<br>

### 🚨 Gefahr - Anmeldung mit Passwort
Die Anmeldung per SSH mit einem Passwort ist **nicht unbedingt eine Gefahr, unsichere Passwörter sind es aber schon**! Da Passwörter häufig wiederverwendet oder an persönlichen Dingen festgemacht werden, bieten Sie häufig eine potenzielle Sicherheitslücke für Angreifer.

#### Aufgabe - Einrichtung SSH Keys
Um diese Gefahr auszuschließend und die Verbindung mit dem Server im gleichen Zuge ein wenig zu erleichtern, können sogenannte SSH Keys genutzt werden. Diese Keys ersetzen das Passwort beim Login und müssen gar nicht mehr manuell beim Verbinden angegeben werden.

Richten Sie die Anmeldung mit Hilfe von SSH Keys auf ihrem System ein.  
Eine Anleitung dafür finden Sie [im Internet](https://www.google.com/search?q=windows+ssh+keys+generieren)!

Verbinden Sie sich anschließend mit Hilfe des SSH Keys (ohne Passworteingabe) mit Ihrem Serversystem.

{{<collapsible label="Lösung">}}
##### SSH Keys generieren
```shell
$ ssh-keygen
  Enter file in which to save the key (...)   # mit Enter bestätigen
  Enter passphrase: [Zufälliger Text]         # mit Enter bestätigen
  Enter passphrase again: [Zufälliger Text]   # nochmal eingeben und bestätigen
  
  Your identification has been saved in .../id_rsa
  Your public key has been saved in .../id_rsa.pub
  The key fingerprint is: ...
```

**Den Public Key auf das Serversystem kopieren**  
Am einfachsten ist es den Inhalt der `id_rsa.pub` Datei per copy & paste auf den Server zu bringen.

```shell
$ mkdir .ssh
$ nano ~/.ssh/authorized_keys

  In diese Datei muss nun der Inhalt der id_rsa.pub Datei eingefügt werden.
  Anschließend speichern und schließen.
```

Wichtig! `~` steht für das jeweilige Homeverzeichnis eines Benutzers. Wenn Sie auf ihrem Serversystem z.B. den User `akmann` registriert haben, muss die `authorized_keys` Datei also unter dem folgenden Pfad liegen: `/home/akmann/.ssh/authorized_keys`
{{</collapsible>}}