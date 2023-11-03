echo -e "\e[31m Installing nginx \e[Om"
dnf install nginx -y

echo -e "\e[32m Replacing nginx default page \e[Om"
cp expense.conf /etc/nginx/default.d/expense.conf

echo -e "\e[33m Removing nginx default page\e[Om"
rm -rf /usr/share/nginx/html/*

echo -e "\e[34m Downloading frontend congiguration file \e[Om"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip 

echo -e "\e[35m Extracting the file \e[Om"
cd /usr/share/nginx/html 
unzip /tmp/frontend.zip

echo -e "\e[36m Starting nginx \e[Om"
systemctl enable nginx 
systemctl restart nginx 
