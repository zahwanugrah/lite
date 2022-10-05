#!/bin/bash
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl="\033[0;1;33m"
wh="\033[0m"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')
clear
echo -e "$y════════════════════════════════════════════════════════════$wh"
echo -e  "  🔰\e[32;1mCPU Model:\e[0m $cname  "
echo -e  "  🔰\e[32;1mNumber Of Cores:\e[0m $cores"
echo -e  "  🔰\e[32;1mCPU Frequency:\e[0m $freq MHz"
echo -e  "  🔰\e[32;1mTotal Amount Of RAM:\e[0m $tram MB"
echo -e  "  🔰\e[32;1mSystem Uptime:\e[0m $up"
echo -e  "  🔰\e[32;1mIsp Name:\e[0m $ISP"
echo -e  "  🔰\e[32;1mIp Vps:\e[0m $IPVPS"
echo -e  "  🔰\e[32;1mCity:\e[0m $CITY"
echo -e  "  🔰\e[32;1mTime:\e[0m $WKT"
echo -e  "  🔰\e[32;1mScript:\e[0m bhoikfost yahya "
echo -e "$y════════════════════════════════════════════════════════════$wh"
echo -e "$y                       Xray VPN  $wh"
echo -e "$y════════════════════════════════════════════════════════════$wh"
echo -e "$yy 01$y. Membuat akun Trojan"
echo -e "$yy 02$y. Menghapus akun Trojan"
echo -e "$yy 03$y. Merenew Akun Trojan"
echo -e "$yy 04$y. Cek Akun Trojan"
echo -e "$y════════════════════════════════════════════════════════════$wh"
echo -e "$yy 05$y. Membuat akun vless"
echo -e "$yy 06$y. Menghapus akun vless"
echo -e "$yy 07$y. Merenew Akun vless"
echo -e "$yy 08$y. Cek vless"
echo -e "$y════════════════════════════════════════════════════════════$wh"
echo -e "$yy 09$y. Membuat akun vmess"
echo -e "$yy 10$y. Menghapus akun vmess"
echo -e "$yy 11$y. Merenew Akun vmess"
echo -e "$yy 12$y. Cek vless"
echo -e "$y════════════════════════════════════════════════════════════$wh"
echo -e "$yy 13$y. Test kecepatan server"
echo -e "$y════════════════════════════════════════════════════════════$wh"
read -p "Select From Options [ 1 - 12 ] : " menu
case "$x" in 
   1 | 01)
   clear
   add-tr
   break
   ;;
   2 | 02)
   clear
   del-tr
   break
   ;;
   3 | 03)
   clear
   renew-tr
   break
   ;;
   4 | 04)
   clear
   cek-tr
   break
   ;;
   5 | 05)
   clear
   add-vless
   break
   ;;
   6 | 06)
   clear
   del-vless
   break
   ;;
   7 | 07)
   clear
   renew-vless
   break
   ;;
   8 | 08)
   clear
   cek-vless
   break
   ;;
   9 | 10)
   clear
   add-ws
   break
   ;;
   10 | 10)
   clear
   del-ws
   break
   ;;
   11 | 11)
   clear
   renew-ws
   break
   ;;
   12 | 12)
   clear
   cek-ws
   break
   ;;
   13 | 13)
   clear
   speedtest
   break
   ;;
   *)
   clear
esac
done
