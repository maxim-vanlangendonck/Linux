# Webserver Hardening
## MariaDB IP-adres veranderen
1. `/etc/my.cnf.d/mariadb-server.cnf`
2. enabled, *::80*
3. bind_address = 192.168.76.2
4. nc -nvz 192.168.76.2 3306 => success!

## MariaDB poortnumer veranderen
1. poortnummer UniSQL = 1978
2. 
3. `sudo semanage port -a -t mysqld_port_t -p tcp 1978`
4. `nc -nvz 192.168.76.2 1978` => success!

## MariaDB directory veranderen
1. `sudo chown mysql:mysql dbdata`
2. `datadir=/dbdata`
3. `sudo systemctl restart mariadb-service`
4. `sudo semanage fcontext -a -t mysqld_db_t "/dbdata"`
`sudo restorecon -Rv /dbdata`

## mysql data input
done
## webserver (apache2)
### testen basisconnectie
geen problemen
### PHP scripts met SELinux context
1. `sudo dnf install mysqlnd`
2. `sudo wget http://157.193.215.171/test.php`
3. 
4. `sudo chcon --reference /var/www/html /var/www/html/test.php`
