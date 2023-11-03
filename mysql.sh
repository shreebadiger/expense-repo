color="\e[35m"
log_file=&>>/tmp/expense.log

echo -e "${color} Disabling default version of the mysql \e[0m"
dnf module disable mysql -y &>>/tmp/expense.log

echo -e "${color} Creating repo file \e[0m"
cp mysql.repo /etc/yum.repos.d/mysql.repo &>>/tmp/expense.log

echo -e "${color} Installing mysql-community-server\e[0m"
dnf install mysql-community-server -y &>>/tmp/expense.log

echo -e "${color} Starting mysql-community-server\e[0m"
systemctl enable mysqld &>>/tmp/expense.log
systemctl start mysqld &>>/tmp/expense.log

echo -e "${color} Setting password to mysql-community-server\e[0m"
mysql_secure_installation --set-root-pass ExpenseApp@1 &>>/tmp/expense.log