echo -e "\e[34m Installing nginx \e[Om"
dnf install nginx -y

echo -e "\e[34m replacing nginx default page  \e[Om"
cp expense.conf /etc/nginx/default.d/expense.conf

echo -e "\e[34m Removening nginx default page\e[Om"
rm -rf /usr/share/nginx/html/*

echo -e "\e[34m downloading frontend congiguration file \e[Om"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip 

echo -e "\e[34m extracting the file \e[Om"
cd /usr/share/nginx/html 
unzip /tmp/frontend.zip

echo -e "\e[34m Starting nginx \e[Om"
systemctl enable nginx 
systemctl restart nginx 