#!/bin/bash
#########################

clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
cd /root

mkdir -p /etc/xray
mkdir -p /etc/v2ray
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/scdomain
touch /etc/v2ray/scdomain


secs_to_human() {
    echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}
start=$(date +%s)
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1

coreselect=''
cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
clear
END
chmod 644 /root/.profile

mkdir -p /var/lib/scrz-prem >/dev/null 2>&1
echo "IP=" >> /var/lib/scrz-prem/ipvps.conf

if [ -f "/etc/xray/domain" ]; then
clear
echo ""
echo -e "$green┌─┐┬ ┬┌┬┐┌─┐┌─┐┌─┐┬─┐┬┌─┐┌┬┐  ┬  ┬┌┬┐┌─┐$NC"
echo -e "$green├─┤│ │ │ │ │└─┐│  ├┬┘│├─┘ │   │  │ │ ├┤ $NC"
echo -e "$green┴ ┴└─┘ ┴ └─┘└─┘└─┘┴└─┴┴   ┴   ┴─┘┴ ┴ └─┘$NC"
echo -e "[ ${red}INFO${NC} ] Autoscript xray vpn lite (multi port)"
echo -e "[ ${red}INFO${NC} ] no licence script (free lifetime)"
echo -e "[ ${red}INFO${NC} ] Pastikan internet lancar saat insatll script"
echo -e "[ ${red}INFO${NC} ] Hubungkan terlebih dahulu IP VPS anda ke Domain"
echo -ne "[ ${yell}WARNING${NC} ] MELANJUTKAN UNTUK INSTALL AUTOSCRIPT  (y/n)? "
read answer
if [ "$answer" == "${answer#[Yy]}" ] ;then
rm setup.sh
sleep 5
exit 0
else
clear
fi
fi
echo ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green ______ ______       ___________ ________            _____  $NC"   
echo -e "$green ___  /____  /__________(_)__  /____  __/______________  /_ $NC"  
echo -e "$green __  __ \_  __ \  __ \_  /__  //_/_  /_ _  __ \_  ___/  __/ $NC"  
echo -e "$green _  /_/ /  / / / /_/ /  / _   <  _  __/ / /_/ /(__  )/ /_   $NC" 
echo -e "$green /_ ___//_/ /_/\____//_/  /_/|_| /_/    \____//____/ \__/   $NC"                                                    
echo -e "$green              ______                                        $NC" 
echo -e "$green _____  _______ ___  /______  _______ _                     $NC"   
echo -e "$green __  / / /  __  /_  __ \_  / / /  __  /                     $NC"  
echo -e "$green _  /_/ // /_/ /_  / / /  /_/ // /_/ /                      $NC"   
echo -e "$green _\__  / \__ _/ /_/ /_/_\__  / \__ _/                       $NC"   
echo -e "$green /____/                /____/                               $NC"   
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green              FREE AUTOSCRIPT VPS                          $NC"
echo -e "$green             NO LICENCE USER SETUP                         $NC"
echo -e "$green            MULTI PORT XRAY 443 + 80                       $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 3
clear

yellow "Add Domain for XRAY VPN"
echo " "
read -rp "Input ur domain : " -e pp
    if [ -z $pp ]; then
        echo -e "
        Nothing input for domain!
        Then a random domain will be created"
    else
        echo "$pp" > /root/scdomain
	echo "$pp" > /etc/xray/scdomain
	echo "$pp" > /etc/xray/domain
	echo "$pp" > /etc/v2ray/domain
	echo $pp > /root/domain
        echo "IP=$pp" > /var/lib/scrz-prem/ipvps.conf
    fi
    
#Instal Xray
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green          Install XRAY              $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "[ ${green}SCRIPT${NC} ] free no licence (lifetime) "
sleep 2
clear
wget https://raw.githubusercontent.com/zahwanugrah/lite/main/xray/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
wget https://raw.githubusercontent.com/zahwanugrah/lite/main/file/bbr.sh chmod +x bbr.sh && sed -i -e 's/\r$//' bbr.sh && screen -S bbr ./bbr.sh
clear
cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
clear
menu
END
chmod 644 /root/.profile

curl -sS ifconfig.me > /etc/myipvps

clear
echo ""
echo ""
echo ""
echo ""
echo ""
echo "=====================-[ SCRIPT INFO ]-===================="
echo ""
echo "----------------------------------------------------------"
echo ""
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - Trojan WS + gRPC        : 443" | tee -a log-install.txt
echo "   - XRAY  Vmess TLS + gRPC  : 443" | tee -a log-install.txt
echo "   - XRAY  Vless TLS + gRPC  : 443" | tee -a log-install.txt
echo "   - XRAY  Vmess None TLS    : 80" | tee -a log-install.txt
echo "   - XRAY  Vless None TLS    : 80" | tee -a log-install.txt
echo "   - Nginx                   : 81" | tee -a log-install.txt
echo ""
echo "------------------------------------------------------------"
echo ""
echo "=========-[ Script Created By Bhoikfost Yahya ]-=========="
echo -e ""
echo ""
echo "" | tee -a log-install.txt
rm /root/setup.sh >/dev/null 2>&1
secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
echo -e "
"
echo -ne "[ ${yell}WARNING${NC} ] Silahkan Reboot Ulang Vps Anda ? (y/n)? "
read answer
if [ "$answer" == "${answer#[Yy]}" ] ;then
exit 0
else
reboot
fi
