#! /bin/bash

# Stop het script bij een onbestaande variabele
set -o nounset
### Algemene variabelen wrden eerst gedefinieerd
# De map waarin je op zoek gaat naar het opgegeven type bestanden
SEARCH_DIR=/etc/alternatives
# De map waar je de documenten gaat opslaan
BACKUP_TEMP_DIR=/usr/share/nginx/html
BACKUP_DIR=/var/www/backups
DATUM=date +"%y-%m-%d"


### --- functions ---

# installeer de webserver, ook al zou de service al geïnstalleerd zijn. 
# Gebruik idempotente commando's waar mogelijk.
function install_nginx() {
  # Ga na of de map voor de web-inhoud bestaat. Indien niet, maak ze aan
  if [ $BACKUP_DIR ]
  then
    mkdir $BACKUP_DIR
  fi

  # Installeer de webserver software 
  sudo dnf install -y nginx
  # Pas de configuratie van de webserver aan
  sed -i 's/$BACKUP_TEMP_DIR/$BACKUP_DIR/' /etc/nginx/nginx.conf

  # Herstart de service
  sudo systemctl start nginx
  sudo systemctl enable nginx

  # Firewall ...
  sudo firewall-cmd --permanent --add-port 88/udp
  sudo firewall-cmd --reload
  >&2 /dev/null
}

# kopieer de symbolisch gelinkte bestanden van de zoekmap naar de backupmap, inclusief indexbestand
function copy_symlink_files() {
  local WorkDIR=$1
  local DestDIR=$2

  # Hint: werk met find en schrijf naar een tijdelijk bestand pamd_index.txt

  #  kopieer alle bestanden uit het indexbestand met een loop
  while  ; do
    find $WorkDIR -name "[e-n]*" -type l | sort | sudo tee $DestDIR/pamd_index.txt > /dev/null
  

	done < # Hier kan je het tijdelijk bestand inlezen in een loop
}

function rename_mtaMTA() {
  # Zorg er voor dat er _geen_ output is van deze functie!

}

function readonly_permissions() {

}

function create_tarball() {
  local WorkDIR=$1
  local FileName=$2
  
  # maak de tarbal aan
  tar -c
  tar -tf $WorkDIR/$FileName | sed "s+./++g" | sed "/^$/d" | sort
  # kopieer de tarball naar de doelmap
  cp /var/www/backups
  # geef de inhoud van de tarbal weer
  printf 'Inhoud van :'
}


### --- main script ---
### Voer de opeenvolgende taken uit

# installeer nginx, ook al is het reeds geïnstalleerd. 
install_nginx

# geef de datum weer van vandaag, gebruik deze globale variabele
printf "Vandaag is het $DATUM\n"

# leegmaken doelmap

copy_symlink_files $SEARCH_DIR $BACKUP_DIR

rename_mtaMTA ...

readonly_permissions ... 

create_tarball 

# Einde script
