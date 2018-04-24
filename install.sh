sudo apt-get install unixodbc unixodbc-dev --install-suggests -y
sudo su 
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
exit
sudo apt-get update
sudo ACCEPT_EULA=Y apt-get install msodbcsql17
wget https://raw.githubusercontent.com/audac1ty/RScript/e9966ab7be5bd6d1c2b36679fcb72b106dd2e388/install_r.r
R CMD BATCH install_r.r
