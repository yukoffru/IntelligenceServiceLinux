
cat > ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
#Определение версии и типа дистрибутива:
#TAG45361
EOF
cat /etc/issue >> ISL.log
cat /etc/*-release >> ISL.log
lsb_release -a >> ISL.log
cat /etc/lsb-release >> ISL.log
cat /etc/redhat-release >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
cat >> ISL.log <<EOF
#Определение версии ядра и разрядности системы:
#TAG45362
EOF
cat /proc/version >> ISL.log
uname -a >> ISL.log
uname -mrs >> ISL.log
rpm -q kernel >> ISL.log
dmesg | grep Linux >> ISL.log
ls /boot | grep vmlinuz- >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
cat >> ISL.log <<EOF
#Информация о переменных окружения:
#TAG45363
EOF
cat /etc/profile >> ISL.log
cat /etc/bashrc >> ISL.log
cat ~/.bash_profile >> ISL.log
cat ~/.bashrc >> ISL.log
cat ~/.bash_logout >> ISL.log
env
set
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
cat >> ISL.log <<EOF
#Список запущенных сервисов. Сервисы, запущенные от привилегированных пользователей:
#TAG45364
EOF
ps aux >> ISL.log
ps -ef >> ISL.log
cat /etc/services >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
cat >> ISL.log <<EOF
#Сервисы, запущенные от root:
#TAG45365
EOF
ps aux | grep root >> ISL.log
ps -ef | grep root >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
cat >> ISL.log <<EOF
#Поиск установленных приложений, их версий и их активности на данный момент:
#TAG45366
EOF
ls -alh /usr/bin/ >> ISL.log
ls -alh /sbin/ >> ISL.log
dpkg -l >> ISL.log
rpm -qa >> ISL.log
ls -alh /var/cache/apt/archivesO >> ISL.log
ls -alh /var/cache/yum/ >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
cat >> ISL.log <<EOF
#Просмотр конфигурационных файлов:
#TAG45367
EOF
cat /etc/syslog.conf >> ISL.log
cat /etc/chttp.conf >> ISL.log
cat /etc/lighttpd.conf >> ISL.log
cat /etc/cups/cupsd.conf >> ISL.log
cat /etc/inetd.conf >> ISL.log
cat /etc/apache2/apache2.conf >> ISL.log
cat /etc/my.conf >> ISL.log
cat /etc/httpd/conf/httpd.conf >> ISL.log
cat /opt/lampp/etc/httpd.conf >> ISL.log
ls -aRl /etc/ | awk '$1 ~ /^.*r.*/' >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
cat >> ISL.log <<EOF
#Поиск и просмотр запланированных задач (cron):
#TAG45368
EOF
crontab -l >> ISL.log
ls -alh /var/spool/cron >> ISL.log
ls -al /etc/ | grep cron >> ISL.log
ls -al /etc/cron* >> ISL.log
cat /etc/cron* >> ISL.log
cat /etc/at.allow >> ISL.log
cat /etc/at.deny >> ISL.log
cat /etc/cron.allow >> ISL.log
cat /etc/cron.deny >> ISL.log
cat /etc/crontab >> ISL.log
cat /etc/anacrontab >> ISL.log
cat /var/spool/cron/crontabs/root >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
cat >> ISL.log <<EOF
#Поиск логинов и паролей в файлах и по именам пользователей:
#TAG45369
EOF
grep -i user [filename] >> ISL.log
grep -i pass [filename] >> ISL.log
grep -C 5 "password" [filename] >> ISL.log
find . -name "*.php" -print0 | xargs -0 grep -i -n "var $password"    >> ISL.log
find / -user [user] >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF

cat >> ISL.log <<EOF
#Обозначение сетевых интерфейсов в системе, проверка подключений к сетям:
#TAG45370
EOF
/sbin/ifconfig -a >> ISL.log
cat /etc/network/interfaces >> ISL.log
cat /etc/sysconfig/network >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF

cat >> ISL.log <<EOF
#Определение конфигураций сетевых адаптеров, а так же DHCP, DNS, и шлюзов:
#TAG45371
EOF
cat /etc/resolv.conf >> ISL.log
cat /etc/sysconfig/network >> ISL.log
cat /etc/networks >> ISL.log
iptables -L >> ISL.log
hostname >> ISL.log
dnsdomainname >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF

cat >> ISL.log <<EOF
#Проверка водящих подключений к системе. Пользователи и хосты:
#TAG45372
EOF
lsof -i >> ISL.log
lsof -i :80 >> ISL.log
grep 80 /etc/services >> ISL.log
netstat -antup >> ISL.log
netstat -antpx >> ISL.log
netstat -tulpn >> ISL.log
chkconfig --list >> ISL.log
chkconfig --list | grep 3:on >> ISL.log
last >> ISL.log
w >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
cat >> ISL.log <<EOF
#Проверка кэша, и сохраненных IP/MAC адресов:
#TAG45373
EOF
arp -e >> ISL.log
route >> ISL.log
/sbin/route –nee >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF

cat >> ISL.log <<EOF
#:Идентификация себя в системе, авторизированные пользователи, список последних авторизированных пользователей, пользователи, находящиеся в системе, последние их действия.
#TAG45374
EOF
id >> ISL.log
who >> ISL.log
w >> ISL.log
last >> ISL.log
cat /etc/passwd | cut -d: -f1    >> ISL.log
grep -v -E "^#" /etc/passwd | awk -F: '$3 == 0 { print $1}'   >> ISL.log
awk -F: '($3 == "0") {print}' /etc/passwd   >> ISL.log
cat /etc/sudoers >> ISL.log
sudo –l >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
cat >> ISL.log <<EOF
#:Просмотр конфиденциальных файлов:
#TAG45375
EOF
cat /etc/passwd >> ISL.log
cat /etc/group >> ISL.log
cat /etc/shadow >> ISL.log
ls -alh /var/mail/ >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
cat >> ISL.log <<EOF
#:Поиск «интересной» информации в домашних директориях, если есть доступ:
#TAG45376
EOF
ls -ahlR /root/ >> ISL.log
ls -ahlR /home/ >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
cat >> ISL.log <<EOF
#:Поиск паролей в скриптах, базах данных и конфигурационных/журналируемых файлах.Пути указаны по умолчанию.
#TAG45377
EOF
cat /var/apache2/config.inc >> ISL.log
cat /var/lib/mysql/mysql/user.MYD >> ISL.log
cat /root/anaconda-ks.cfg >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
cat >> ISL.log <<EOF
#:Анализ последних действий пользователя, поиск текстовых паролей, обнаружение следов редактирования:
#TAG45378
EOF
cat ~/.bash_history >> ISL.log
cat ~/.nano_history >> ISL.log
cat ~/.atftp_history >> ISL.log
cat ~/.mysql_history >> ISL.log
cat ~/.php_history >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
cat >> ISL.log <<EOF
#:Общий поиск пользовательской информации:
#TAG45379
EOF
cat ~/.bashrc >> ISL.log
cat ~/.profile >> ISL.log
cat /var/mail/root >> ISL.log
cat /var/spool/mail/root >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
cat >> ISL.log <<EOF
#:Поиск информации о приватных ключах:
#TAG45380
EOF
cat ~/.ssh/authorized_keys >> ISL.log
cat ~/.ssh/identity.pub >> ISL.log
cat ~/.ssh/identity >> ISL.log
cat ~/.ssh/id_rsa.pub >> ISL.log
cat ~/.ssh/id_rsa >> ISL.log
cat ~/.ssh/id_dsa.pub >> ISL.log
cat ~/.ssh/id_dsa >> ISL.log
cat /etc/ssh/ssh_config >> ISL.log
cat /etc/ssh/sshd_config >> ISL.log
cat /etc/ssh/ssh_host_dsa_key.pub >> ISL.log
cat /etc/ssh/ssh_host_dsa_key >> ISL.log
cat /etc/ssh/ssh_host_rsa_key.pub >> ISL.log
cat /etc/ssh/ssh_host_rsa_key >> ISL.log
cat /etc/ssh/ssh_host_key.pub >> ISL.log
cat /etc/ssh/ssh_host_key >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
cat >> ISL.log <<EOF
#:Поиск перезаписываемых конфигурационных файлов в /etc. Возможность перенастройки служб.
#TAG45381
EOF
ls -aRl /etc/ | awk '$1 ~ /^.*w.*/' 2>/dev/null       >> ISL.log           # Все
ls -aRl /etc/ | awk '$1 ~ /^..w/' 2>/dev/null         >> ISL.log             # Владелец
ls -aRl /etc/ | awk '$1 ~ /^.....w/' 2>/dev/null      >> ISL.log            # Группа
ls -aRl /etc/ | awk '$1 ~ /w.$/' 2>/dev/null           >> ISL.log           # Другие
find /etc/ -readable -type f 2>/dev/null               >> ISL.log            # Все
find /etc/ -readable -type f -maxdepth 1 2>/dev/null  >> ISL.log # Все
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
cat >> ISL.log <<EOF
#:Поиск информации в /var.
#TAG45382
EOF
ls -alh /var/log >> ISL.log
ls -alh /var/mail >> ISL.log
ls -alh /var/spool >> ISL.log
ls -alh /var/spool/lpd >> ISL.log
ls -alh /var/lib/pgsql >> ISL.log
ls -alh /var/lib/mysql >> ISL.log
cat /var/lib/dhcp3/dhclient.leases >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
cat >> ISL.log <<EOF
#:Поиск скрытых настроек/файлов/файлов с информацией о базах, данных на web сервере.
#TAG45383
EOF
ls -alhR /var/www/ >> ISL.log
ls -alhR /srv/www/htdocs/ >> ISL.log
ls -alhR /usr/local/www/apache22/data/ >> ISL.log
ls -alhR /opt/lampp/htdocs/ >> ISL.log
ls -alhR /var/www/html/ >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
cat >> ISL.log <<EOF
#:Поиск информации в лог – файлах:
#TAG45384
EOF
cat /etc/httpd/logs/access_log >> ISL.log
cat /etc/httpd/logs/access.log >> ISL.log
cat /etc/httpd/logs/error_log >> ISL.log
cat /etc/httpd/logs/error.log >> ISL.log
cat /var/log/apache2/access_log >> ISL.log
cat /var/log/apache2/access.log >> ISL.log
cat /var/log/apache2/error_log >> ISL.log 
cat /var/log/apache2/error.log >> ISL.log
cat /var/log/apache/access_log >> ISL.log
cat /var/log/apache/access.log >> ISL.log
cat /var/log/auth.log >> ISL.log
cat /var/log/chttp.log >> ISL.log
cat /var/log/cups/error_log >> ISL.log
cat /var/log/dpkg.log >> ISL.log
cat /var/log/faillog >> ISL.log
cat /var/log/httpd/access_log >> ISL.log
cat /var/log/httpd/access.log >> ISL.log
cat /var/log/httpd/error_log >> ISL.log
cat /var/log/httpd/error.log >> ISL.log
cat /var/log/lastlog >> ISL.log
cat /var/log/lighttpd/access.log >> ISL.log
cat /var/log/lighttpd/error.log >> ISL.log
cat /var/log/lighttpd/lighttpd.access.log >> ISL.log
cat /var/log/lighttpd/lighttpd.error.log >> ISL.log
cat /var/log/messages >> ISL.log
cat /var/log/secure >> ISL.log
cat /var/log/syslog >> ISL.log
cat /var/log/wtmp >> ISL.log
cat /var/log/xferlog >> ISL.log
cat /var/log/yum.log >> ISL.log
cat /var/run/utmp >> ISL.log
cat /var/webmin/miniserv.log >> ISL.log
cat /var/www/logs/access_log >> ISL.log
cat /var/www/logs/access.log >> ISL.log
ls -alh /var/lib/dhcp3/ >> ISL.log
ls -alh /var/log/postgresql/ >> ISL.log
ls -alh /var/log/proftpd/ >> ISL.log
ls -alh /var/log/samba/ >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
cat >> ISL.log <<EOF
#:Монтирование файловых систем:
#TAG45385
EOF
mount >> ISL.log
df –h >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
cat >> ISL.log <<EOF
#:Поиск размонтированных файловых систем:
#TAG45386
EOF
cat /etc/fstab >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
cat >> ISL.log <<EOF
#:Поиск директорий, в которых можно записывать и запускать файлы. В общих директориях: /tmp, /var/tmp, /dev/shm:
#TAG45387
EOF
find / -writable -type d 2>/dev/null   >> ISL.log    # общедоступные папки
find / -perm -222 -type d 2>/dev/null   >> ISL.log  # общедоступные папки
find / -perm -o w -type d 2>/dev/null   >> ISL.log  # общедоступные папки
find / -perm -o x -type d 2>/dev/null   >> ISL.log  # общедоступные папки
find / \( -perm -o w -perm -o x \) -type d 2>/dev/null >> ISL.log  # общедоступные папки & исполняемые папки
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
cat >> ISL.log <<EOF
#:Языки программирования и компиляторы:
#TAG45388
EOF
find / -name perl* >> ISL.log
find / -name python* >> ISL.log
find / -name gcc* >> ISL.log
find / -name cc >> ISL.log
python –version >> ISL.log
ruby –version >> ISL.log
gcc --version >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
cat >> ISL.log <<EOF
#:Поиск возможности загрузки файлов на сервер:
#TAG45389
EOF
find / -name wget >> ISL.log
find / -name nc* >> ISL.log
find / -name netcat* >> ISL.log
find / -name tftp* >> ISL.log
find / -name ftp >> ISL.log
wget –version >> ISL.log
nc -v >> ISL.log
cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
cat >> ISL.log <<EOF
#:END
EOF

cat >> ISL.log <<EOF
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
