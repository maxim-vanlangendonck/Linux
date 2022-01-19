# scripting102 - first steps in automating

Voor sommige van de opgaven zijn er unit tests voorzien die je een aanwijzing geven of je op de goede weg zit. De bedoeling is dat je de gevraagde scripts in de subdirectory `script102` opslaat. Als je je in directory `script102` bevindt, kan je de tests uitvoeren met:

```
$ tests/runtests.sh
Installing ShellCheck. Please enter your sudo password!
[sudo] password for user: 
Last metadata expiration check performed 0:02:24 ago on Tue Oct 20 14:05:56 2015.
Dependencies resolved.

... [installatie ShellCheck en BATS]

Running test /home/user/scripts/test102/01-onderelkaar.bats
 ✗ Het script onderelkaar.sh moet bestaan
   (in test file tests/01-onderelkaar.bats, line 10)
     `[ -f "${script}" ]' failed
 ✗ Het script moet uitvoerbaar zijn
   (in test file tests/01-onderelkaar.bats, line 14)
     `[ -x "${script}" ]' failed

... [meer uitvoer van het testscript]
```

Indien nodig wordt bij het voor de eerste keer uitvoeren van het testscript het Unit-testframework voor Bash, [BATS](https://github.com/sstephenson/bats), geïnstalleerd en ook de statische analysetool [ShellCheck](https://www.shellcheck.net/).

## script102 opdrachten

De unit tests van de oefeningen worden in volgorde uitgevoerd. Zolang er nog fouten in een oefening gevonden zijn, worden de tests van de volgende nog niet uitgevoerd.

1. Maak een script met de naam `onderelkaar.sh` die de op de command line als argumenten ingevoerde zin woord per woord onder elkaar afdrukt op het scherm. Als de gebruiker geen argumenten opgegeven heeft, wordt er een gepaste foutboodschap op stderr afgedrukt en stopt het script met een foutcode (exit-status verschillend van 0). Voorbeeld van de uitvoer:

    ```
    $ ./onderelkaar.sh dit is een test
    dit
    is
    een
    test
    $ echo $?
    0
    $ ./onderelkaar.sh
    Geen argumenten opgegeven!
    $ echo $?
    1
    ```

2. Schrijf een script `gebruikerslijst.sh` dat een gesorteerde lijst van users (uit `/etc/passwd`) weergeeft op het scherm. Maak gebruik van het het commando `cut`.
3. Schrijf een script `elf-params.sh` dat werkt zoals `onderelkaar.sh`, maar maximaal 11 parameters afdrukt. Extra parameters worden genegeerd.  Positionele parameters en `shift` zijn een tip.
4. Schrijf een script `datum.sh` dat het aantal elementen van het commando `date` weergeeft en daarna al de elementen onder elkaar. Maak gebruik van positionele parameters en het `set` commando. Gebruik ook een `while`-lus.

## Gebruikte bronnen

Als je gebruik maakt van andere bronnen (bv. blog-artikel of HOWTO die je op het Internet vond), voeg die dan hier toe aan het einde van dit document. Zo kan je het later makkelijk terug vinden.
