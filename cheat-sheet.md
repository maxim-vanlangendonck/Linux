# Cheat sheet en checklists

Naam student: Maxim Van Langendonck

## Commando's
| Taak                   			| Commando 					|
| :---                   			| :---     					|
| IP-adress(en) opvragen 			|`ip a`   					|
| User aanmaken		 			|`useradd`					|
| user aanpassen	 			|`usermod`					|
| user verwijderen	 			|`userdel`					|
| groep aanmaken	 			|`groupadd`					|
| groep aanpassen 				|`groupmod`					|
| groep verwijderen				|`groupdel`					|
| wie is er ingelogd?	 			|`who` 						|
| in welke groepen zit de user 			|`groups`					|
| wat is de id van de user?			|`id`						|
| primaire groep aanpassen			|`sudo usermod -g groep gebruiker`		|
| user toevoegen en verwijderen uit groepen	|`sudo usermod -G groep1,groep2 gebruiker`	|
| user toevoegen en lid blijven van andere groep|`sudo usermod -aG groep gebruiker`		|
| eigen wachtwoord aanpassen			|`passwd`					|
| wachtwoord van user aanpassen als admin	|`sudo passwd <username>`			|
| surfen nr link				|`curl`						|

## Belangrijkste filter-commando's
| Commando | Doel 								|
| :---	   | :--- 								|
| `awk`	   | Veelzijdige tool voor bewerken van tekst				|
| `cat`    | Druk inhoud bestand(en) af op stdout				|
| `cut`	   | Selecteer "kolommen" uit tekstbestanden				|
| `fmt`    | Herformatteer tekst (bv. bepaald # kolommen			|
| `grep`   | Zoek ahv reguliere expressies naar tekstpatronen in bestanden	|
| `head`   | Toon de eerste regels van een tekstbestand				|
| `join`   | Voeg twee tekstbestanden samen ahv een gemeenschappelijke kolom	|
| `nl`     | Voeg regelsnummers toe aan een bestand				|
| `paste`  | Voeg twee tekstbestanden regel per regel samen			|
| `sed`	   | Veelzijdige tool voor bewerken van tekst (Stream EDitor)		|
| `sort`   | Sorteer tekst							|
| `tail`   | Toon de laatste regels van een tekstbestand			|
| `tr`     | Zoek en vervang lettertekens in tekst				|
| `uniq`   | Verwijder dubbele rijen uit een gesorteerd tekstbestand		|
| `wc`     | Tel karakters, woorden of lijnen in een tekstbestand		|

## Configuratiebestanden
1. Gebruikers: `/etc/passwd`
2. Wachtwoorden: `/etc/shadow`
3. Groepen: `/etc/group`
4. DHCP: `/etc/dhpc/dhcpd.conf`
5. Apache: `/etc/httpd/`
6. Hoofdconfiguratiebestand Apache: `/etc/httpd/conf/httpd.conf`
7. configuratiebestanden plugins Apache: `/etc/httpd/conf.d/*.conf`
8. HTML-bestanden Apache DocumentRoot: `/var/www/html/`
9. logbestanden Apache: `/var/log/httpd/`
10. Hoofdconfiguratiebestand SELinux: `/etc/selinux/config`

## Git workflow
Eenvoudige workflow voor een éénmansproject met synchronisatie naar een "remote repository".

| Taak                                        | Commando                  |
| :---                                        | :---                      |
| Huidige toestand project                    | `git status`              |
| Bestanden toevoegen/klaarzetten voor commit | `git add FILE...`         |
| Bestanden "committen"                       | `git commit -m 'MESSAGE'` |
| Synchroniseren naar Github                  | `git push`                |
| Wijzigingen op Github binnenhalen           | `git pull`                |

## Gebruik van VIM
| Taak				| Commando		|
| :---				| :---			|
| bestand aanmaken		| `vim bestand.txt`	|
| normal mode -> insert mode	| `i`			|
| insert mode -> normal mode	| esc			|
| opslaan			| `:w`			|
| opslaan en afsluiten		| `:wq`			|
| afsluiten zonder opslaan	| `:q!`			|

## Checklist netwerkconfiguratie
1. Is het IP-adres correct? `ip a`
2. Is de router/default gateway correct ingesteld? `ip r -n`
3. Is er een DNS-server? `cat /etc/resolv.conf`

## Software-installatie Debian
1. overzicht geïnstalleerde packages: `dpkg -l`
2. alle packages bijwerken: `apt upgrade`
3. info bijwerken op repo servers: `apt update`

## Software-installatie Red Hat
1. installatie package: `dnf install <package_name>`
2. bijwerken van info op repo servers: `dnf check-update`
3. bijwerken van alles packages: `dnf upgrade`
4. bijwerken van enkele packages: `dnf upgrade <package_name>`
5. lijst geïnstalleerde packages: `dnf list installed`
6. lijst beschikbare packages: `dnf list available`

## Toon sockets in gebruik
1. commando: `ss`


| Taak			| Commando		|
| :---			| :---			|
| toon server sockets	| `ss -l` --listening	|
| toon TCP sockets	| `ss -t` --tcp		|
| toon UDP sockets	| `ss -u` --udp		|
| toon poort nummers	| `ss -n` --numeric	|
| toon processen	| `ss -p`--processes	|

## commando journalctl
| Taak						| Commando					|
| :---						| :---						|
| toon laatste log en wacht op veranderingen	| `journalctl -f` --follow			|
| toon alleen logs van SERVICE			| `journalctl -u SERVICE` --unit=SERVICE	|
| match executable				| `journalctl /usr/sbin/dhclient`		|
| match device node				| `journalctl /de/sda`				|
| toon auditd logs				| `journalctl _TRANSPORT=audit`			|
| toon logs sinds laatste boot			| `journalctl -b` --boot			|
| kernal berichten				| `journalctl -k` --dmesg			|
| output omdraaien				| `journalctl -r` --reverse			|
| toon alleen errors of erger			| `journalctl -p err` --priority=err		|
| sinds gisteren				| `journalctl --since=yesterday`		|

## firewall commando's (!met root rechten)
| Taak					| Commando				|
| :---					| :---					|
| toon alle zones			| `firewall-cmd --get-zones`		|
| actieve zones				| `firewall-cmd --get-active-zones`	|
| voeg IFACE toe aan actieve zone	| `firewall-cmd --add-interface=IFACE`	|
| toon huidige regels			| `firewall-cmd --list-all`		|
| laat service toe			| `firewall-cmd --add-service=http`	|
| toon beschikbare services		| `firewall-cmd --get-services`		|
| laat poort toe			| `firewall-cmd --get-services`		|
| firewall regels herladen		| `firewall-cmd --reload`		|
| alle netwerkverkeer blokkeren		| `firewall-cmd --panic-on`		|
| paniekmodus uitschakelen		| `firewall-cmd --panic-off`		|

## Vagrant
### Belangrijkste commando's
|Taak				| Commando			|
|:---				| :---				|
| overzicht omgeving		| `vagrant status`		|
| start VM op			| `vagrant up VM`		|
| inloggen op VM		| `vagrant ssh VM`		|
| VM uitschakelen		| `vagrant halt VM`		|
| VM rebooten			| `vagrant reload VM`		|
| installatie-script uitvoeren	| `vagrant provision VM`	|
| VM vernietigen		| `vagrant destroy VM`		|

## Troubleshooting
### Network Access Layer
### Internet Layer
### Transport Layer
### Application Layer