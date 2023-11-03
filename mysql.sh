
echo -e "\e[36m Disabling default version of the mysql \e[0m"
dnf module disable mysql -y &>>/tmp/expense.log

echo -e "\e[36m Creating repo file \e[0m"
cp mysql.repo /etc/yum.repos.d/mysql.repo &>>/tmp/expense.log

echo -e "\e[36m Installing mysql-community-server\e[0m"
dnf install mysql-community-server -y &>>/tmp/expense.log

echo -e "\e[36m Starting mysql-community-server\e[0m"
systemctl enable mysql &>>/tmp/expense.log
systemctl start mysql &>>/tmp/expense.log

echo -e "\e[36m Setting password to mysql-community-server\e[0m"
mysql_secure_installation --set-root-pass ExpenseApp@1 &>>/tmp/expense.log