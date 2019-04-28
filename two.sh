#!/bin/sh
echo -e " 升级系统"
sudo apt-get update && sudo apt-get dist-upgrade -y
echo -e " 安装中文字符集"
sudo apt-get install xfonts-intl-chinese && sudo apt-get install ttf-wqy-microhei -y
echo -e "下载git工具"
sudo apt-get install git -y
echo -e "安装xrdp"
sudo apt-get install tightvncserver xrdp -y
echo -e "安装xubuntu桌面"
sudo apt-get install xubuntu-desktop -y
echo xfce4-session >~/.xsession
