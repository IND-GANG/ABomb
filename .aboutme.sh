#!/bin/bash

banner() {
   clear
   toilet -f ivrit -F metal "ABOUT"
   echo ""
   toilet -f digital -F gay " BY ADIL"
   echo ""
}

   banner
   echo ""
   echo -e "\e[1;32m MY NAME IS MUHAMMED ADIL\[0m"
   echo -e "\e[1;32m MY AGE IS 15\e[0m"
   echo -e "\e[1;32m [1] MY Instagram\e[0m"
   echo -e "\e[1;32m [2] MY YouTube\e[0m"
   echo -e "\e[1;32m [3] MY GitHub\e[0m"
   echo -e "\e[1;32m [4] MY WhatsApp\e[0m"
   read ch
   clear
   if [ $ch -eq 1 ];then
   (toilet -f ivrit -F gay "LOADING....")
   clear
   banner
        termux-open https://www.instagram.com/m._adill/
        exit
   elif [ $ch -eq 2 ];then
   (toilet -f ivrit -F gay "LOADING....")
   clear
   banner
        termux-open https://https://m.youtube.com/channel/UCdczEjunA1vsYhwgarREc6w
        exit
   elif [ $ch -eq 3 ];then
   (toilet -f ivrit -F gay "LOADING....")
   clear
   banner
        termux-open https://github.com/IND-GANG?tab=repositories
        exit
   elif [ $ch -eq 4 ];then
   (toilet -f ivrit -F gay "LOADING....")
   clear
   banner
        termux-open https://wa.me/919633189774?/
        exit
   else
        (echo -e "\e[4;32m404 ERROR\e[0m")
        play .denied.mp3
        exit
        pause
  fi
done
exit
done
