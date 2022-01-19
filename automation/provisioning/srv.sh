#! /bin/bash
#
# Provisioning script for server www

#------------------------------------------------------------------------------
# Bash settings
#------------------------------------------------------------------------------

# Enable "Bash strict mode"
set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # do not mask errors in piped commands

#------------------------------------------------------------------------------
# Variables
#------------------------------------------------------------------------------

# Location of provisioning scripts and files
export readonly PROVISIONING_SCRIPTS="/vagrant/provisioning/"
# Location of files to be copied to this server
export readonly PROVISIONING_FILES="${PROVISIONING_SCRIPTS}/files/${HOSTNAME}"

#------------------------------------------------------------------------------
# "Imports"
#------------------------------------------------------------------------------

# Actions/settings common to all servers
source ${PROVISIONING_SCRIPTS}/common.sh

#------------------------------------------------------------------------------
# Provision server
#------------------------------------------------------------------------------

log "Starting server specific provisioning tasks on ${HOSTNAME}"

log "installeer BIND"
sudo dnf install -y bind

log "wijzig zodat hij naar alle interfaces luistert en zodat iedereen toegang heeft"
sed -i 's/127.0.0.1/any/' /etc/named.conf
sed -i 's/localhost/any/' /etc/named.conf

log "wijzig zodat recursion af staat en dat er een zone gemaakt wordt"
sudo sed -i 's/recursion no/' /etc/named.conf
sudo sed -zi 's/zone "." IN {\n\ttype hint;\n\tfile "named.ca";\n};/zone "linux.lan" IN {\n\ttype master:\n\tfile "linux.lan";\n\tnotify yes;\n\tallow-update { none; };\n};/' /etc/named.conf

log "copy inhoud van zone file"
sudo cp "${PROVISIONING_FILES}/linux.lan" /var/named

log "toegang aan poort 53 die door BIND gebruikt wordt"
sudo firewall-cmd --permanent --add-port 53/udp
sudo firewall-cmd --reload

log "start de service"
sudo systemctl start named
sudo systemctl enable named

log "installation of DHCP"
sudo dnf install -y dhcp-server

log "dhcp configuratiebestand aanpassen"
sudo sed -zi 's/# see dhcpd.conf(5) man page\n#/subnet 192.168.76.0 netmask 255.255.255.0 {\n\trange 192.168.76.100 192.168.76.150;\n\toption domain-name-servers 192.168.76.254;\n\toption domain-name "linux.lan";\n}/' /etc/dhcp/dhcpd.conf

log 