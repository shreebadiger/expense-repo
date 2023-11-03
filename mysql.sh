dnf module disable mysql -y 

cp mysql.repo /etc/yum.repos.d/mysql.repo

dnf install mysql-community-server -y

systemctl enable mysql

systemctl start mysql

mysql_secure_installation --set-root-pass ExpenseApp@1