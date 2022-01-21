#! /bin/bash

# Stop het script bij een onbestaande variabele
set -o nounset
### Algemene variabelen wrden eerst gedefinieerd
# De map waarin je op zoek gaat naar het opgegeven type bestanden
SEARCH_DIR=/etc/alternatives
# De map waar je de documenten gaat opslaan
BACKUP_TEMP_DIR=/BackupDir
BACKUP_DIR=/var/www/backups
DATUM=$(date +%Y-%m-%d)


### --- functions ---

# installeer de webserver, ook al zou de service al geïnstalleerd zijn. 
# Gebruik idempotente commando's waar mogelijk.
function install_nginx() {
  # Ga na of de map voor de web-inhoud bestaat. Indien niet, maak ze aan
  if [ ! -f $BACKUP_DIR ]; then
    mkdir -p $BACKUP_DIR
  fi

  # Installeer de webserver software 
  sudo dnf install -y nginx &> /dev/null
  # Pas de configuratie van de webserver aan
  sed -i 's|/usr/share/nginx/html|/var/www/backups|g' /etc/nginx/nginx.conf

  # Herstart de service
  sudo systemctl start nginx && sudo systemctl enable nginx

  # Firewall ...
  sudo firewall-cmd --zone=public --permanent --add-service=http

  sudo firewall-cmd --zone=public --permanent --add-service=https

  sudo firewall-cmd --reload
}

# kopieer de symbolisch gelinkte bestanden van de zoekmap naar de backupmap, inclusief indexbestand
function copy_symlink_files() {
  local WorkDIR=$1
  local DestDIR=$2

if [ ! "${DestDIR}" ]; then
  echo "Directory bestaat niet"
  exit 1
fi
  # Hint: werk met find en schrijf naar een tijdelijk bestand pamd_index.txt
find "${WorkDIR}" -name "[e-n]*" -type l | sort | sudo tee "${DestDIR}"/pamd_index.txt > /dev/null
  #  kopieer alle bestanden uit het indexbestand met een loop
  while read line  
  do
    cp -R "${line}" "${DestDIR}"

	done < "${DestDIR}"/pamd_index.txt # Hier kan je het tijdelijk bestand inlezen in een loop
}

function rename_mtaMTA() {
  # Zorg er voor dat er _geen_ output is van deze functie!
    for i in "${BACKUP_TEMP_DIR}"/mta-*; do
      rename "mta-" "MTA-" "${i}"
    done
}

function readonly_permissions() {
  for i in "${BACKUP_TEMP_DIR}"/*; do
    chmod 400 "${i}"
  done
}

function create_tarball() {
  local WorkDIR=$1
  local FileName=$2
  
  # maak de tarbal aan
  tar -czfc "${FileName}" "${WorkDIR}"
  # kopieer de tarball naar de doelmap
  cp "${FileName}" "${BACKUP_DIR}"
  # geef de inhoud van de tarbal weer
  printf 'Inhoud van %s' "${BACKUP_DIR}/${FileName}:"
  tar -tvf "${BACKUP_DIR}/${FileName}"
}


### --- main script ---
### Voer de opeenvolgende taken uit

# installeer nginx, ook al is het reeds geïnstalleerd. 
install_nginx

# geef de datum weer van vandaag, gebruik deze globale variabele
echo "Vandaag is het ${DATUM}"

# leegmaken doelmap
rm "${BACKUP_DIR}"/*
copy_symlink_files "${SEARCH_DIR}" "${BACKUP_DIR}"

rename_mtaMTA

readonly_permissions "${BACKUP_TEMP_DIR}"

create_tarball "${BACKUP_TEMP_DIR}" "alternatives_${DATUM}.tgz"

# Einde script
