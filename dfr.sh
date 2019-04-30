#!/bin/sh

BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}1-升级系统${NC}"
sudo apt-get update && sudo apt-get dist-upgrade -y

echo -e "${BLUE}2-安装build-essential${NC}"
sudo apt-get install build-essential -y

echo -e "${BLUE}3-安装Python Dev${NC}"
sudo apt-get install python-dev -y

echo -e "${BLUE}4-安装git${NC}"
sudo apt-get install git -y

echo -e "${BLUE}5-安装PIP${NC}"
sudo apt-get install python-pip -y

echo -e "${BLUE}6-安装python-netaddr地址模块${NC}"
sudo apt-get install python-netaddr -y

echo -e "${BLUE}安装Django和依赖${NC}"
sudo pip install Django==1.6.5
sudo pip install pygeoip
sudo pip install django-pagination
sudo pip install django-tables2==1.0
sudo pip install django-compressor==1.4
sudo pip install django-htmlmin
sudo pip install django-filter==0.7
sudo pip install six==1.5.2

echo -e "${BLUE}下载Django-Tables2-simplerfilter文件${NC}"
cd /opt/
sudo wget https://github.com/benjiec/django-tables2-simplefilter/archive/master.zip -O django-tables2-simplefilter.zip
sudo unzip django-tables2-simplefilter.zip
sudo mv django-tables2-simplefilter-master/ django-tables2-simplefilter/
cd django-tables2-simplefilter
sudo python setup.py install

echo -e "${BLUE}下载SubnetTree${NC}"
cd /opt/
sudo git clone git://git.bro-ids.org/pysubnettree.git
cd pysubnettree
sudo python setup.py install

echo -e "${BLUE}下载并安装NodeJS${NC}"
cd /opt/
sudo wget http://nodejs.org/dist/v4.7.1/node-v4.7.1.tar.gz
sudo tar xzvf node-v4.7.1.tar.gz;
cd node-v4.7.1
sudo ./configure
sudo make
sudo make install

echo -e "${BLUE}安装promise和less${NC}"
sudo npm install -g promise
sudo npm install -g less

echo -e "${BLUE}安装DionaeaFR${NC}"
cd /opt/
sudo wget https://github.com/rubenespadas/DionaeaFR/archive/master.zip -O DionaeaFR.zip
sudo unzip DionaeaFR.zip
sudo mv DionaeaFR-master/ DionaeaFR

echo -e "${BLUE}下载MaxMind公司的Geo数据库${NC}"
cd /opt/
sudo mv /opt/mycode/GeoIP.dat DionaeaFR/DionaeaFR/static
sudo mv /opt/mycode/GeoLiteCity.dat DionaeaFR/DionaeaFR/static

echo -e "${BLUE}配置Settings...${NC}"
sudo cp /opt/DionaeaFR/DionaeaFR/settings.py.dist /opt/DionaeaFR/DionaeaFR/settings.py
cd /opt/DionaeaFR/DionaeaFR
echo -e "${BLUE}现在编译/opt/DionaeaFR/DionaeaFR/settings.py文件，并且修改sqlite DB的位置...${NC}"
