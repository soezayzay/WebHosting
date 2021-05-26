#!/bin/bash
#Author : SoeZayZay
#Github : https://github.com/soezayzay
#Description:These codes aren't allowed to copy and edit.If you want to change the  codes and redistribute this tool please contact the Author.Please respect the Author.
clear
function banner(){
printf $'\e[1;34m  __        __   _       _   _           _   _              \e[0m\n'
printf $'\e[1;34m  \ \      / /__| |__   | | | | ___  ___| |_(_)_ __   __ _  \e[0m\n'
printf $'\e[1;34m   \ \ /\ / / _ \  _ \  | |_| |/ _ \/ __| __| |  _ \ / _` | \e[0m\n'
printf $'\e[1;34m    \ V  V /  __/ |_) | |  _  | (_) \__ \ |_| | | | | (_| | \e[0m\n'
printf $'\e[1;34m     \_/\_/ \___|_.__/  |_| |_|\___/|___/\__|_|_| |_|\__  | \e[0m\n'
printf $'\e[1;34m                                                     |___/  \e[0m\n'
echo
printf $'   \e[101m\e[1;77m Author:SoeZayZay Github: https://github.com/soezayzay \e[0m\n'
echo
printf $'\e[1;36m   ┌──────────────────────────────────────────────────────┐ \e[0m\n'
printf $'\e[1;36m   │                                                      │ \e[0m\n'
printf $'\e[1;36m   │  \e[1;33m[\e[1;34m1\e[1;33m]\e[1;37m Localhost       \e[1;33m[\e[1;34m2\e[1;33m]\e[1;37m Ngrok      \e[1;33m[\e[1;34m3\e[1;33m]\e[1;37m Kill Server \e[1;36m │ \e[0m\n'
printf $'\e[1;36m   │                                                      │ \e[0m\n'
printf $'\e[1;36m   │  \e[1;33m[\e[1;34m4\e[1;33m]\e[1;37m Clear           \e[1;33m[\e[1;34m5\e[1;33m]\e[1;37m Exit                       \e[1;36m │ \e[0m\n'
printf $'\e[1;36m   │                                                      │ \e[0m\n'
printf $'\e[1;36m   └──────────────────────────────────────────────────────┘ \e[0m\n'
echo
}
function menu(){
read -p $'   \e[1;34m[\e[1;32m*\e[1;34m]\e[1;33m Choose an option  \e[1;34m: \e[1;37m' option
if [ $option == "1" ];
then
echo
read -p $'   \e[1;34m[\e[1;32m*\e[1;34m]\e[1;33m Enter File Path   \e[1;34m: \e[1;37m' path
echo
read -p $'   \e[1;34m[\e[1;32m*\e[1;34m]\e[1;33m Enter Port Number \e[1;34m: \e[1;37m' port
echo
echo $'   \e[1;34m[\e[1;32m*\e[1;34m]\e[1;33m Website Url       \e[1;34m:\e[1;37m http://localhost:'$port
echo
cd $path
php -S localhost:$port
elif [ $option == "2" ];
then
echo
read -p $'   \e[1;34m[\e[1;32m*\e[1;34m]\e[1;33m Enter File Path   \e[1;34m: \e[1;37m' path
echo
read -p $'   \e[1;34m[\e[1;32m*\e[1;34m]\e[1;33m Enter Port Number \e[1;34m: \e[1;37m' port
echo
./ngrok http $port >  /dev/null 2>&1 &
sleep 6 
link=$(curl -S -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
function link_err(){
if [ $link == ""];
then
link="http://localhost:$port"
fi
}
link_err
echo $'   \e[1;34m[\e[1;32m*\e[1;34m]\e[1;33m Website Url       \e[1;34m:\e[1;37m '$link
cd $path
php -S localhost:$port > /dev/null 2>&1 &
echo
menu
elif [ $option == "3" ];
then
echo
sleep 1
printf $'                 \e[1;34m[\e[1;33m*\e[1;34m]\e[1;31m Server has been killed \e[1;34m[\e[1;33m*\e[1;34m]\e[0m\n'
pkill -f -2  php > /dev/null 2>&1 &
sleep 2 
clear 
banner
menu
elif [ $option == "4" ];
then
clear 
banner
menu
elif [ $option == "5" ];
then
echo
printf $'                         \e[1;34m[\e[1;33m*\e[1;34m]\e[1;31m Exiting \e[1;34m[\e[1;33m*\e[1;34m]\e[0m\n'
sleep 2
exit
else
echo
printf $'                    \e[1;34m[\e[1;33m*\e[1;34m]\e[1;31m Invalid Option \e[1;34m[\e[1;33m*\e[1;34m]\e[0m\n'
sleep 2 
clear 
banner
menu
fi
}
banner
menu