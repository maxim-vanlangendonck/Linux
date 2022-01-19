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

log "installation of Apache"
dnf install -y httpd mod_ssl

log "installation of php"
dnf install php -y

log "installation of php connection mysql"
dnf install -y php-mysqlnd

log "php script kopiëren"
cp "${PROVISIONING_FILES}/test.php" /var/www/html

log "starting and enabling apache server"
systemctl start httpd && systemctl enable httpd

log "Setting firewall rules for http & https"
firewall-cmd --zone=public --add-service=http --permanent
firewall-cmd --zone=public --add-service=https --permanent

log "allow connection through firewall for mysql"
firewall-cmd --zone=public --add-service=mysql --permanent

log "Reload firewall"
firewall-cmd --reload

log "SELinux context"
sudo chcon -R -t httpd_sys_rw_content_t /var/www/html

log "configueren httpd zodat SELinux deze toelaat"
setsebool -P httpd_can_network_connect_db on