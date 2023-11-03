
echo -e "\e[31m Disabling default version of the mysql \e[0m"
dnf module disable mysql -y 

echo -e "\e[31m Creating repo file \e[0m"
cp mysql.repo /etc/yum.repos.d/mysql.repo

echo -e "\e[31m Installing mysql-community-server\e[0m"
dnf install mysql-community-server -y

echo -e "\e[31m Starting mysql-community-server\e[0m"
systemctl enable mysql
systemctl start mysql

echo -e "\e[31m Setting password to mysql-community-server\e[0m"
mysql_secure_installation --set-root-pass ExpenseApp@1