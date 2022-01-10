#!/bin/bash -e

if [ "$UID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi
if [ -x /usr/bin/apt-get ]; then
    wget https://repo.zabbix.com/zabbix/5.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_5.0-1+focal_all.deb
    apt install ./zabbix-release_5.0-1+focal_all.deb
    apt-get update
    apt install zabbix-agent
    ufw allow 10050/tcp
    ufw allow 10051/tcp
    sed -i 's/Server=127.0.0.1/Server=192.168.1.9/' /etc/zabbix/zabbix_agentd.conf
    sed -i 's/ServerActive=127.0.0.1/ServerActive=192.168.1.9/' /etc/zabbix/zabbix_agentd.conf
    HOSTNAME=`hostname` && sed -i "s/Hostname=Zabbix\ server/Hostname=$HOSTNAME/" /etc/zabbix/zabbix_agentd.conf
    service zabbix-agent restart
fi