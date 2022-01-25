# Cheat sheet en checklists

Naam student: Maxim Van Langendonck

## Commando's deel 1: Users
| Taak  | Commando  |
| :---  | :---      |
| Wat is jouw username? | `whoami`  |
| Wie is er ingelogd?    | `who`     |
| Toont wie er ingelogd is, en wat ze doen  | `w`   |
| user id, primary group id, lijst van groepen | `id`   |
| inloggen als een andere user | `su <username>`    |
| user aanmaken | `useradd` |
| user verwijderen  | `userdel <parameters> <username>` |
| user aanpassen    | `usermod <parameters> <username>` |
| het veranderen van de login shell | `chsh`    |
| het veranderen van het wachtwoord | `passwd`  |
| een groep aanmaken    | `groupadd <naam>` |
| user toevoegen aan groep en lid blijven van andere groep|`sudo usermod -aG groep gebruiker`		|
| primaire groep aanpassen			|`sudo usermod -g groep gebruiker`		|
| user toevoegen en verwijderen uit groepen	|`sudo usermod -G groep1,groep2 gebruiker`	|
| in welke groepen zit de user  | `groups`  |
| een groep aanpassen   | `groupmod <parameter> <groepnaam>`    |
| owner van een file aanpassen | `chown`    |
| groep owner aanpassen | `chgrp`   |

### Het commando useradd
| Parameter | Uitleg    |
| :---      | :---      |
| `-m`  | Het forceren van het maken van een homedirectory  |
| `-d <homedirectory-naam>` | Naam geven aan de homedirectory   |
| `-c <descriptie>` | Een descriptie geven aan de user  |
| `-p <wachtwoord>` | Wachtwoord instellen voor de gebruiker    |

### Het commando userdel
| Parameter | Uitleg    |
| :---      | :---  |
| `-r`  | Verwijdert de homedirectory van de user   |
| `-f`  | Het forceren van het verwijderen  |

### Het commando usermod
| Parameter | Uitleg    |
| :---      | :---  |
| `-d <homedirectory>`  | De nieuwe homedirectory   |
| `l <nieuwe_login>`    | Een nieuwe login toekennen aan de user    |
| `-L`  | Het locken van de user, een '!' zetten voor het geëncrypteerde wachtwoord |
| `-p <nieuw_wachtwoord>` | het wachtwoord veranderen van de gebruiker  |
| `-U` | het unlocken van de user   |

### Het commando groupmod
| Parameter | Uitleg    |
| `-n <new_naam>`  | naam aanpassen |

## Commando's deel 2: Streams, pipes, redirects en filters
| Taak  | Commando  |
| :---  | :---  |
| tegengaan dan een files verwijderd wordt door streams | `set -o noclobber`    |

### Regular Expressions
| Taak  | Commando  |
| :---  | :---  |
| lijst geven van geëxporteerde variabelen  | `env` |
| het exporteren van variabelen | `export <variabele>`  |
| lijst weergeven van envrionment variabelen    | `set` |

### I/O Redirection
| Syntax    | Betekenis |
| :---  | :---  |
| `>`   | schrijft uitvoer weg  |
| `>>`  | voegt aan het einde toe   |
| `2>`  | schrijft foutboodschappen weg |
| `cmd < file`   | gebruik inhoud van file als invoer voor cmd  |
| `cmd1 | cmd2` | gebruik invoer van cmd1 als invoer voor cmd2  |

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

## Commando's deel 3: Software-installatie, netwerkconfiguratie
### Netwerkinstelling opvragen
| Taak  | Commando  |
| :---  | :---  |
| IP-adres/netmask  | `ip address`  |
| Default gateway   | `ip route`    |
| DNS-server: EL:   | `cat /etc/resolv.conf`    |
| DNS-server Debain, Fedora | `resolvectl status <interface>`   |

## Commando's
| Taak                   			| Commando 					|
| :---                   			| :---     					|
| IP-adress(en) opvragen 			|`ip a`   					|
| surfen nr link				|`curl`						|
| query log aanzetten   | `sudo rndc querylog`  |

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

## Commando's deel 5: Hardening
### Firewall (!met root rechten)
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

### SELinux (RedHat)
1. Staat SELinux aan? `getenforce`
2. Booleans SELinux `getsebool setsebool`
3. context, labels: `ls -Z chcon restorecon`
4. policy modules: `sepolicy`

## Commando's deel 6: automatiseren
### fouten opsporen
| Commando  | Taak  |
| :---  | :---  |
| `bash -n script.sh`   | syntax check  |
| `shellcheck script.sh`    | shellcheck    |
| `set -o errexit`   | script aborten on nonzero exitstatus |
| `set -o nounset`   | script aborten op unbound variable   |
| `set -o pipefail`  | don't hide errors within pipes

### Vagrant: Belangrijkste commando's
|Taak				| Commando			|
|:---				| :---				|
| overzicht omgeving		| `vagrant status`		|
| start VM op			| `vagrant up VM`		|
| inloggen op VM		| `vagrant ssh VM`		|
| VM uitschakelen		| `vagrant halt VM`		|
| VM rebooten			| `vagrant reload VM`		|
| installatie-script uitvoeren	| `vagrant provision VM`	|
| VM vernietigen		| `vagrant destroy VM`		|

## Commando's deel 7: cronjobs, complexe scripts
### Cronjobs
| Commando  | Taak  |
| :---  | :---  |
| `jobs`    | lijst van achtergrondprocessen    |
| `jobs -l` | idem, toon ook Process ID (PID)   |
| `fg NUM`  | breng proces op voorgrond |
| `bg NUM`  | herstart stilgelegd proces op achtergrond |
| `at`  | voer commando's uit op specifiek tijdstip |
| `atq` | geeft lijst van geplande taken    |
| `atrm NUM`    | verwijder taak met id NUM |
| `batch`   | voer taak uit wanneer systeem minder belast is

## Deel 8: Troubleshooting
### Network Access Layer
1. `ip link`
### Internet Layer
1. Checking local network configuration:
   1. IP adres: `ip a`
      1. check configuratie `/etc/sysconfig/network-scripts/ifcfg-*`
   2. default gateway: `ip r`
   3. dns service `/etc/resolv.conf`
### Transport Layer
1. service running? `sudo systemctl status SERVICE`
2. correct port/interface? `sudo ss -tulpn`
3. firewall settings: `sudo firewall-cmd --list-all`

### Het commando ss
| Taak			| Commando		|
| :---			| :---			|
| toon server sockets	| `ss -l` --listening	|
| toon TCP sockets	| `ss -t` --tcp		|
| toon UDP sockets	| `ss -u` --udp		|
| toon poort nummers	| `ss -n` --numeric	|
| toon processen	| `ss -p`--processes	|
### Application Layer
### commando journalctl
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
### SELinux troubleshooting
1. Check booleans
2. check file context

## Commando's deel 9: Mounting
1. formatteren van een partitie: `mkfs`
2. een partitie mounten: `mount`
3. mount punten bekijken: `mount | grep sd`

## Configuratiebestanden
1. Gebruikers: `/etc/passwd`
2. Wachtwoorden: `/etc/shadow`
3. Default waarden voor het commando useradd: `/etc/default/useradd`
4. Groepen: `/etc/group`
5. DHCP: `/etc/dhpc/dhcpd.conf`
6. Apache: `/etc/httpd/`
7. Hoofdconfiguratiebestand Apache: `/etc/httpd/conf/httpd.conf`
8. configuratiebestanden plugins Apache: `/etc/httpd/conf.d/*.conf`
9. HTML-bestanden Apache DocumentRoot: `/var/www/html/`
10. logbestanden Apache: `/var/log/httpd/`
11. Hoofdconfiguratiebestand SELinux: `/etc/selinux/config`
12. files voor profile settings en default waarden `/etc/skel/`
13. default settings voor user passwords: `/etc/login.defs`
14. BIND: `/etc/named.conf`
15. Zonebestanden BIND: `/var/named`
16. Hoofdconfiguratiebestand voor SELinux: `/etc/selinux/config`
17. bestand voor bash configuratie `~/.bashrc`

## Gebruik van VIM
| Taak				| Commando		|
| :---				| :---			|
| bestand aanmaken		| `vim bestand.txt`	|
| normal mode -> insert mode	| `i`			|
| insert mode -> normal mode	| esc			|
| opslaan			| `:w`			|
| opslaan en afsluiten		| `:wq`			|
| afsluiten zonder opslaan	| `:q!`			|