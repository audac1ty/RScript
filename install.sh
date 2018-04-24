#!/bin/bash
su - sshuser -c "sudo apt-get install unixodbc* -y" 
sudo wget https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add microsoft.asc
sudo chmod o+w /etc/apt/sources.list.d/
sudo wget https://packages.microsoft.com/config/ubuntu/16.04/prod.list 
sudo mv prod.list /etc/apt/sources.list.d/mssql-release.list
sudo chmod o-w /etc/apt/sources.list.d/
sudo chown root /etc/apt/sources.list.d/prod.list
sudo chgrp root /etc/apt/sources.list.d/prod.list
sudo chmod g-w /etc/apt/sources.list.d/prod.list
su - sshuser -c "sudo apt-get update"
su - sshuser -c "sudo ACCEPT_EULA=Y apt-get install msodbcsql17 -y"
sudo chmod o+w /usr/lib64/microsoft-r/3.3/lib64/R/etc
sudo sed "s/^CXX1X.=.*$/CXX1X = gcc -std=c++0x/" /usr/lib64/microsoft-r/3.3/lib64/R/etc/Makeconf > /usr/lib64/microsoft-r/3.3/lib64/R/etc/Makeconf~
sudo rm /usr/lib64/microsoft-r/3.3/lib64/R/etc/Makeconf
sudo sed "s/^CXX1XSTD.=.*$/CXX1XSTD = -std=c++0x -fPIC/" /usr/lib64/microsoft-r/3.3/lib64/R/etc/Makeconf~ > /usr/lib64/microsoft-r/3.3/lib64/R/etc/Makeconf
sudo rm /usr/lib64/microsoft-r/3.3/lib64/R/etc/Makeconf~
sudo chmod o-w /usr/lib64/microsoft-r/3.3/lib64/R/etc
su - sshuser -c "wget https://raw.githubusercontent.com/audac1ty/RScript/e9966ab7be5bd6d1c2b36679fcb72b106dd2e388/install_r.r"
su - sshuser -c "R CMD BATCH install_r.r"
