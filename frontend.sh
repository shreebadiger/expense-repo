echo -e "\e[31m Installing nginx \e[0m"
dnf install nginx -y

echo -e "\e[32m Replacing nginx default page \e[0m"
cp expense.conf /etc/nginx/default.d/expense.conf

echo -e "\e[33m Removing nginx default page\e[0m"
rm -rf /usr/share/nginx/html/*

echo -e "\e[34m Downloading frontend congiguration file \e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip 

echo -e "\e[35m Extracting the file \e[0m"
cd /usr/share/nginx/html 
unzip /tmp/frontend.zip

echo -e "\e[36m Starting nginx \e[0m"
systemctl enable nginx 
systemctl restart nginx 
