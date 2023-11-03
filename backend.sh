color="\e[34m"
log_file=&>>/tmp/expense.log


echo -e "${color} Disabling Nodejs and installing Newer version \e[0m"
dnf module disable nodejs -y &>>/tmp/expense.log
dnf module enable nodejs:18 -y &>>/tmp/expense.log
dnf install nodejs -y &>>/tmp/expense.log

echo -e "${color} Enabling systemd service \e[0m"
cp backend.service /etc/systemd/system/backend.service &>>/tmp/expense.log

echo -e "${color} Creating user \e[0m"
useradd expense &>>/tmp/expense.log

echo -e "${color} Creating a directory to run the app \e[0m"
mkdir /app &>>/tmp/expense.log

echo -e "${color} Downloading and extracting dependencies for nodejs \e[0m"
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip &>>/tmp/expense.log
cd /app &>>/tmp/expense.log
unzip /tmp/backend.zip &>>/tmp/expense.log

cd /app &>>/tmp/expense.log
npm install &>>/tmp/expense.log

dnf install mysql -y &>>/tmp/expense.log

mysql -h 172.31.46.185 -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>/tmp/expense.log

systemctl daemon-reload &>>/tmp/expense.log

systemctl enable backend &>>/tmp/expense.log

systemctl restart backend &>>/tmp/expense.log


