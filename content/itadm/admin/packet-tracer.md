---
title: "🔎 Aufgaben zum Packet Tracer"
date: 2020-12-28T12:23:01Z
---

Mit Hilfe des Packet Tracers können wir schnell und einfach **verschiedenste Netzwerktopologien**  simulieren und testen. Diese Simulationen könnten anschließend direkt in die Realität übertragen werden.

Der Packet Tracer stellt uns eine breite Palette verschiedener Cisco Netzwerkkomponenten für die Planung unseres Netzwerks zur Verfügung. Diese Konfigurationen können schlussendlich aber leicht auch auf Komponenten anderer Hersteller übertragen werden.

<br>

## Aufgabe 1 - Das erste Subnetz

Ziel der Aufgabe ist es **ein Subnetz mit zwei oder mehr Endgeräten** (PCs/Laptops) zu erstellen. Diese Endgeräte sollen sich netzwerktechnisch gegenseitig erreichen können.

Nutzen Sie die folgende Netzwerkkonfiguration:  
**IP-Adressbereich**: 192.168.1.0  
**Subnetzmaske**: 255.255.255.0  
**Default-Gateway**: 192.168.1.1

Sie benötigen folgende Komponenten:  
**1x Switch (2960)**  
**2x Endgeräte (PC/Laptop)**

> Sie müssen die Hardware miteinander verkabeln und die Netzwerkkonfiguration in den Endgeräten hinterlegen. Anschließend können Sie mit Hilfe eines Pings die gegenseitige Erreichbarkeit der Geräte prüfen.

{{<collapsible label="Hilfe">}}
Ungefähr so müsste das Netzwerk aussehen...
![Single Subnet](/itadm/images/pt_single_subnet.png)

#### 1. PC Desktop öffnen
> Doppelklick auf den Rechner und dann oben auf Desktop.
![PC Desktop](/itadm/images/pt_device_desktop.png)

#### 2. IP Konfiguration vornehmen
> Beide Endgeräte wie hier zu sehen konfigurieren.
![IP Konfiguration](/itadm/images/pt_device_config.png)

#### 3. Ping aus Command Prompt absetzen
> Mit Hilfe des Ping Befehls die IP-Adresse des anderen Rechners anpingen.
![Ping](/itadm/images/pt_device_ping.png)

<a href="/itadm/downloads/single_subnet.pkt" download>Lösungsdatei herunterladen</a>
{{</collapsible>}}

<br>

## Aufgabe 2 - Routing zwischen Subnetzen

Erweitern Sie das Netzwerk um **ein zweites Subnetz** wie in Aufgabe 1 und verbinden Sie die beiden Subnetzen mit Hilfe eines Routers. Ziel ist es, dass die Endgeräte aus dem einem mit den Endgeräten aus dem anderen Subnetz kommunzieren können.

Nutzen Sie die folgende Netzwerkkonfiguration für das zweite Subnetz:  
**IP-Adressbereich**: 192.168.2.0  
**Subnetzmaske**: 255.255.255.0  
**Default-Gateway**: 192.168.2.1

Sie benötigen folgende Komponenten:  
**1x Router (2901)**  
**1x Switch (2960)**  
**2x Endgeräte (PC/Laptop)**

> Sie müssen wie in Aufgabe 1 die Endgeräte mit dem Switch verkabeln und dann die beiden Subnetze **durch den Router miteinander verbinden**. Anschließend müssen Sie dem Router mehrere IP-Adressen zuweisen (für jedes Interface eine IP-Adresse als Default-Gateway) und ein **statisches Routing einrichten**, sodass die Endgeräte Subnetz-übergreifend miteinander kommunizieren können.

{{<collapsible label="Hilfe">}}
Ungefähr so müsste das Netzwerk aussehen...
![Single Subnet](/itadm/images/pt_multiple_subnets.png)

#### 1. Subnetz wie in Aufgabe 1 verkabeln und konfigurieren

#### 2. Router-Interfaces konfigurieren
> Die beiden Interfaces an denen die Switch angeschlossen sind benötigen IP-Adressen. Das Interface erhält immer die Default-Gateway Adresse des jeweiligen Subnetzes.
![Router Konfiguration](/itadm/images/pt_router_config.png)

#### 3. Routing konfigurieren
> Hier muss nun die Route zwischen den beiden Subnetzen wie folgt eingetragen werden.
![Router Konfiguration](/itadm/images/pt_router_static.png)

#### 4. Konnektivität prüfen
> Wie in Aufgabe eins einen Ping absetzen, nur dieses Mal Subnetz-übergreifend.
![Ping](/itadm/images/pt_device_ping.png)

<a href="/itadm/downloads/multiple_subnets.pkt" download>Lösungsdatei herunterladen</a>
{{</collapsible>}}

<br>

## Netzwerksicherheit - Firewall und DMZ

Um die Netzwerksicherheit zu erhöhen werden in komplexeren Netzwerken Firewalls eingesetzt, welche verschiedene Netze voneinander abgrenzen. Häufig wird hierbei **das interne Netz vom Internet und ggf. einer Demilitarisierten Zone (DMZ) abgegrenzt**.

Die Konfiguration eines solchen Netzwerks würde Kenntnisse in der Konfiguration von Cisco Netzwerkkomponenten voraussetzen. Aus diesem Grund bauen wir dieses Netzwerk nicht selbstständig auf, sondern schauen uns ein solches Netzwerk beispielhaft an und prüfen es.

Öffnen Sie das Beispiel über den **Reiter Datei** oben links:  
`Datei > Beispiel öffnen...`  
Öffnen sie nun folgendes Beispiel:  
`03 Cybersecurity > ASA > enable outside to inside.pkt`

Sie sollten nun dieses Netzwerk angezeigt bekommen:
![Netzwerk mit Firewall](/itadm/images/pt_firewall.png)