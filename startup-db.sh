set -m
/usr/bin/mysqld_safe &
RET=1
while [[ RET -ne 0 ]]; do
  sleep 3
  mysql -uroot -e "status" > /dev/null
  RET=$?
done
mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASS}'"
mysql -e "GRANT ALL PRIVILEGES ON . TO '${MYSQL_USER}'@'%' WITH GRANT OPTION"
mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASS}'"
mysql -e "GRANT ALL PRIVILEGES ON . TO '${MYSQL_USER}'@'localhost' WITH GRANT OPTION"
fg