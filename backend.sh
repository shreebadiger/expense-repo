echo -e "\e[31m Disabling Nodejs and installing Newer version \e[Om"
dnf module disable nodejs -y
dnf module enable nodejs:18 -y
dnf install nodejs -y

echo -e "\e[31m Enabling systemd service \e[Om"
cp backend.service /etc/systemd/system/backend.service

echo -e "\e[33m Creating user \e[Om"
useradd expense

echo -e "\e[34m Creating a directory to run the app \e[Om"
mkdir /app 

echo -e "\e[35m Downloading and extracting dependencies for nodejs \e[Om"
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip 
cd /app 
unzip /tmp/backend.zip

cd /app 
npm install 

dnf install mysql -y 

mysql -h 172.31.46.185 -uroot -pExpenseApp@1 < /app/schema/backend.sql 

systemctl daemon-reload

systemctl enable backend

systemctl restart backend


