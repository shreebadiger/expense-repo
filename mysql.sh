
echo -e "\e[33m Disabling default version of the mysql \e[0m"
dnf module disable mysql -y &>>/tmp/expense.log

echo -e "\e[33m Creating repo file \e[0m"
cp mysql.repo /etc/yum.repos.d/mysql.repo &>>/tmp/expense.log

echo -e "\e[33m Installing mysql-community-server\e[0m"
dnf install mysql-community-server -y &>>/tmp/expense.log

echo -e "\e[33m Starting mysql-community-server\e[0m"
systemctl enable mysql &>>/tmp/expense.log
systemctl start mysql &>>/tmp/expense.log

echo -e "\e[33m Setting password to mysql-community-server\e[0m"
mysql_secure_installation --set-root-pass ExpenseApp@1 &>>/tmp/expense.log