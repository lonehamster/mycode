#!/bin/sh
echo -e "开始配置环境"
echo -e "1"
sudo apt-get update
echo -e "2"
sudo apt-get dist-upgrade -y
echo -e "3"
sudo apt-get install software-properties-common -y
echo -e "4导入ppa蜜罐源"
sudo add-apt-repository ppa:honeynet/nightly
echo -e "5"
sudo apt-get update
echo -e "6开始部署dionaea"
sudo apt-get install dionaea -y
echo -e "7启动dionaea"
sudo service dionaea start
