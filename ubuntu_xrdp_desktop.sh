#!/bin/sh
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}1-升级系统${NC}"
sudo apt-get update && sudo apt-get dist-upgrade -y
echo -e "${BLUE}2-安装中文字符集${NC}"
sudo apt-get install xfonts-intl-chinese -y && sudo apt-get install ttf-wqy-microhei -y
echo -e "${BLUE}3-下载git工具${NC}"
sudo apt-get install git -y
echo -e "${BLUE}4-安装xrdp${NC}"
sudo apt-get install tightvncserver xrdp -y
echo -e "${BLUE}5-安装xubuntu桌面${NC}"
sudo apt-get install xubuntu-desktop -y
echo xfce4-session >~/.xsession
sed -i '/test -x/  ixfce4-session' /etc/xrdp/startwm.sh
sed -i '8 ixfce4-session' /etc/X11/Xsession
sudo service xrdp restart
