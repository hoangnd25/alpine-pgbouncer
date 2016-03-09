#!/bin/sh
echo \""$PG_USER"\" \""$PG_PASSWD"\" >> /etc/pgbouncer/userlist.txt
sed -i.bak -e 's/PG_DBNAME/'${PG_DBNAME}'/' -e 's/PG_HOST/'${PG_HOST}'/' -e 's/PG_PORT/'${PG_PORT}'/' /etc/pgbouncer/pgbouncer.ini
echo admin_users = "$PG_USER" >> /etc/pgbouncer/pgbouncer.ini
/usr/bin/pgbouncer /etc/pgbouncer/pgbouncer.ini
