#!
sudo apt-get install unixodbc* -y
sudo su 
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
exit
sudo apt-get update
sudo ACCEPT_EULA=Y apt-get install msodbcsql17
sudo chmod o+w /usr/lib64/microsoft-r/3.3/lib64/R/etc
sudo sed "s/^CXX1X.=.*$/CXX1X = gcc -std=c++0x/" /usr/lib64/microsoft-r/3.3/lib64/R/etc/Makeconf > /usr/lib64/microsoft-r/3.3/lib64/R/etc/Makeconf~
sudo rm /usr/lib64/microsoft-r/3.3/lib64/R/etc/Makeconf
sudo sed "s/^CXX1XSTD.=.*$/CXX1XSTD = -std=c++0x -fPIC/" /usr/lib64/microsoft-r/3.3/lib64/R/etc/Makeconf~ > /usr/lib64/microsoft-r/3.3/lib64/R/etc/Makeconf
sudo rm /usr/lib64/microsoft-r/3.3/lib64/R/etc/Makeconf~
sudo chmod o-w /usr/lib64/microsoft-r/3.3/lib64/R/etc
wget https://raw.githubusercontent.com/audac1ty/RScript/e9966ab7be5bd6d1c2b36679fcb72b106dd2e388/install_r.r
R CMD BATCH install_r.r
