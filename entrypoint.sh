#!/bin/sh

cd /etc/pgbouncer

echo \""$PG_USER"\" \""$PG_PASSWD"\" > userlist.txt
echo "" >> userlist.txt

echo [databases] > pgbouncer.ini

echo $PG_DBNAME = host=$PG_HOST port=$PG_PORT auth_user=$PG_USER >> pgbouncer.ini
echo "" >> pgbouncer.ini

echo [pgbouncer] >> pgbouncer.ini
echo listen_port = $LISTEN_PORT >> pgbouncer.ini
echo listen_addr = $LISTEN_ADDR >> pgbouncer.ini
echo auth_type = md5 >> pgbouncer.ini
echo auth_file = /etc/pgbouncer/userlist.txt >> pgbouncer.ini
echo logfile = /var/log/pgbouncer/pgbouncer.log >> pgbouncer.ini
echo pidfile = /var/run/pgbouncer/pgbouncer.pid >> pgbouncer.ini
echo admin_users = "$PG_USER" >> /etc/pgbouncer/pgbouncer.ini

pgbouncer pgbouncer.ini
