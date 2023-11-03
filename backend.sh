color="\e[34m"
log_file=&>>/tmp/expense.log


echo -e "${color} Disabling Nodejs and installing Newer version \e[0m"
dnf module disable nodejs -y &>>log_file
dnf module enable nodejs:18 -y &>>log_file
dnf install nodejs -y &>>log_file
echo $?

echo -e "${color} Enabling systemd service \e[0m"
cp backend.service /etc/systemd/system/backend.service &>>log_file
echo $?

echo -e "${color} Creating user \e[0m"
useradd expense &>>log_file
echo $?

echo -e "${color} Creating a directory to run the app \e[0m"
mkdir /app &>>log_file
echo $?


echo -e "${color} Deleting old application content \e[0m"
mkdir /app/* &>>log_file
echo $?

echo -e "${color} Downloading and extracting dependencies for nodejs \e[0m"
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip &>>log_file
cd /app &>>/tmp/expense.log
unzip /tmp/backend.zip &>>log_file
echo $?

cd /app 
npm install &>>log_file
echo $?

echo -e "${color} Installing mysql client \e[0m"
dnf install mysql -y &>>log_file
echo $?

echo -e "${color} Load schema \e[0m"
mysql -h 172.31.46.185 -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>log_file
echo $?

echo -e "${color} Reloading systemd service \e[0m"
systemctl daemon-reload &>>log_file
echo $?

echo -e "${color} Starting backend service \e[0m"
systemctl enable backend &>>log_file
systemctl restart backend &>>log_file
echo $?

