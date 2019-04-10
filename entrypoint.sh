#!/bin/sh

urldecode() {
    local url_encoded="${2//+/ }"
    printf '"%s" "%b"' "${1}" "${url_encoded//%/\\x}"
}

cd /etc/pgbouncer

urldecode $PG_USER $PG_PASSWD > userlist.txt
echo "" >> userlist.txt

echo [databases] > pgbouncer.ini

export IFS=";"
for DB_NAME in $PG_DBNAME; do
    echo $DB_NAME = host=$PG_HOST port=$PG_PORT auth_user=$PG_USER >> pgbouncer.ini
done
echo "" >> pgbouncer.ini

echo [pgbouncer] >> pgbouncer.ini
echo listen_port = $LISTEN_PORT >> pgbouncer.ini
echo listen_addr = $LISTEN_ADDR >> pgbouncer.ini
echo auth_type = md5 >> pgbouncer.ini
echo auth_file = /etc/pgbouncer/userlist.txt >> pgbouncer.ini
echo logfile = /var/log/pgbouncer/pgbouncer.log >> pgbouncer.ini
echo pidfile = /var/run/pgbouncer/pgbouncer.pid >> pgbouncer.ini
echo ignore_startup_parameters = extra_float_digits >> pgbouncer.ini
echo admin_users = "$PG_USER" >> /etc/pgbouncer/pgbouncer.ini

pgbouncer pgbouncer.ini
