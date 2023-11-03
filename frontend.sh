color="\e[33m"
log_file=&>>/tmp/expense.log

echo -e "${color} Installing nginx \e[0m"
dnf install nginx -y &>>/tmp/expense.log

echo -e "${color} Replacing nginx default page \e[0m"
cp expense.conf /etc/nginx/default.d/expense.conf &>>/tmp/expense.log

echo -e "${color} Removing nginx default page\e[0m"
rm -rf /usr/share/nginx/html/* &>>/tmp/expense.log

echo -e "${color} Downloading frontend congiguration file \e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/expense.log

echo -e "${color} Extracting the file \e[0m"
cd /usr/share/nginx/html &>>/tmp/expense.log
unzip /tmp/frontend.zip &>>/tmp/expense.log

echo -e "${color} Starting nginx \e[0m"
systemctl enable nginx &>>/tmp/expense.log
systemctl restart nginx &>>/tmp/expense.log
