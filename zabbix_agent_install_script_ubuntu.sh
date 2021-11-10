sudo apt update
sudo wget https://repo.zabbix.com/zabbix/5.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_5.0-1+focal_all.deb
sudo dpkg –i zabbix-release_5.0-1+focal_all.deb
sudo apt update
sudo apt install zabbix-agent
sudo sed -i 's/Server=127.0.0.1/Server=192.168.1.174/' /etc/zabbix/zabbix_agentd.conf
sudo echo "zabbix installed."
sudo ufw allow 10050
sudo ufw allow 10051