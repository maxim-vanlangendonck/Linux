# script101 - combining commands into scripts

Dit document kan je gebruiken om te noteren bij het make van de eerste labo-opdrachten omtrent scripting. Meer bepaald leren we hier werken met variabelen.

Wil je noteren omtrent je voorbereidingen: feel free om deze template uit te breiden!

Als je gebruik maakt van andere bronnen (bv. blog-artikel of HOWTO die je op het Internet vond), voeg die dan toe aan het einde van dit document. Zo kan je het later makkelijk terug vinden.
## Streams, pipes, redirects
1. Code nodig: 
	 ```Bash
	join landen autokentekens > landenkentekens
	```
4. code nodig:
	```Bash
	cut -b 3- landenkentekens > landenkentekens2
	```
5. code1:
	```Bash
	echo Italië I >> landenkentekens2
	```
code 2:```Bash
	echo Spanje E >> landenkentekens2
	```
## Filters

## Variabelen

Geef zoals gewoonlijk het commando om de opgegeven taak uit te voeren en controleer ook het resultaat.

1. Druk met behulp van de juiste systeemvariabele de gebruikte bash-versie af op het scherm. Geef het gebruikte commando weer.
2. Je bent ingelogd als gewone gebruiker.
    1. Maak een variabele `pinguin` aan en geef deze de waarde Tux.
    2. Hoe kan je de inhoud opvragen van deze variabele en afdrukken op het scherm?
    3. Open nu een sub(bash)shell in je huidige bashomgeving.
    4. Hoe kan je controleren dat er nu twee bashshells actief zijn en dat de ene een subshell is van de andere?
    5. Probeer nu in deze nieuwe subshell de inhoud van de variabele PINGUIN af te drukken op het scherm. Lukt dit?
    6. De verklaring hiervoor ligt in het type variabele. Welke soort variabele is PINGUIN en hoe kan je dit controleren? Keer hiervoor terug naar je oorspronkelijke bashshell
    7. Zorg er nu voor dat de inhoud van PINGUIN ook in elke nieuwe subshell kan gelezen worden? Hoe doe je dit? Schrijf het gebruikte commando neer.
    8. Open opnieuw een sub(bash)shell in je huidige bashomgeving en controleer of je nu de inhoud van PINGUIN kan lezen. Welk soort variabele is PINGUIN nu? Doe dan ook de controle.
3. Zoek de inhoud op van volgende shellvariabelen en vul volgende tabel aan:

    | Variabele  | Waarde |
    | :---       | :---   |
    | `PATH`     |        |
    | `HISTSIZE` |        |
    | `UID`      |        |
    | `HOME`     |        |
    | `HOSTNAME` |        |
    | `LANG`     |        |
    | `USER`     |        |
    | `OSTYPE`   |        |
    | `PWD`      |        |
    | `MANPATH`  |        |
