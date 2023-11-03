color="\e[35m"
log_file=&>>/tmp/expense.log

echo -e "${color} Disabling default version of the mysql \e[0m"
dnf module disable mysql -y &>>log_file
if [ $? -eq 0 ]; then
echo -e "\e[36m success \e[0m"
else
echo -e "\e[36m Failure \e[0m"
fi

echo -e "${color} Creating repo file \e[0m"
cp mysql.repo /etc/yum.repos.d/mysql.repo &>>log_file
if [ $? -eq 0 ]; then
echo -e "\e[36m success \e[0m"
else
echo -e "\e[36m Failure \e[0m"
fi

echo -e "${color} Installing mysql-community-server\e[0m"
dnf install mysql-community-server -y &>>log_file
if [ $? -eq 0 ]; then
echo -e "\e[36m success \e[0m"
else
echo -e "\e[36m Failure \e[0m"
fi

echo -e "${color} Starting mysql-community-server\e[0m"
systemctl enable mysqld &>>log_file
systemctl start mysqld &>>log_file
if [ $? -eq 0 ]; then
echo -e "\e[36m success \e[0m"
else
echo -e "\e[36m Failure \e[0m"
fi

echo -e "${color} Setting password to mysql-community-server\e[0m"
mysql_secure_installation --set-root-pass ExpenseApp@1 &>>log_file
if [ $? -eq 0 ]; then
echo -e "\e[36m success \e[0m"
else
echo -e "\e[36m Failure \e[0m"
fi