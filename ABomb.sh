#!/bin/bash

detect_distro() {
    if [[ "$OSTYPE" == linux-android* ]]; then
            distro="termux"
    fi

    if [ -z "$distro" ]; then
        distro=$(ls /etc | awk 'match($0, "(.+?)[-_](?:release|version)", groups) {if(groups[1] != "os") {print groups[1]}}')
    fi

    if [ -z "$distro" ]; then
        if [ -f "/etc/os-release" ]; then
            distro="$(source /etc/os-release && echo $ID)"
        elif [ "$OSTYPE" == "darwin" ]; then
            distro="darwin"
        else
            distro="invalid"
        fi
    fi
    figlet LOADING....
# Loading spinner
    source <(echo "c3Bpbm5lcj0oICd8JyAnLycgJy0nICdcJyApOwoKY291bnQoKXsKICBzcGluICYKICBwaWQ9JCEKICBmb3IgaSBpbiBgc2VxIDEgMTBgCiAgZG8KICAgIHNsZWVwIDE7CiAgZG9uZQoKICBraWxsICRwaWQgIAp9CgpzcGluKCl7CiAgd2hpbGUgWyAxIF0KICBkbyAKICAgIGZvciBpIGluICR7c3Bpbm5lcltAXX07IAogICAgZG8gCiAgICAgIGVjaG8gLW5lICJcciRpIjsKICAgICAgc2xlZXAgMC4yOwogICAgZG9uZTsKICBkb25lCn0KCmNvdW50" | base64 -d)
    clear
}
banner() {
    clear
    echo -e "\e[1;31m"
    if ! [ -x "$(command -v figlet)" ]; then
        echo 'Introducing ABomb'
    else
        figlet A-Bomb
    fi
    if ! [ -x "$(command -v toilet)" ]; then
        echo -e "\e[4;34m This Bomber Was Created By \e[1;32mADIL \e[0m"
        echo -e "\e[4;34m CREDIT TO \e[1:32mSPEEDX \e[0m"
    else
        echo -e "\e[1;34mCreated By \e[1;34m"
        toilet -f mono12 -F gay ADIL
    fi
    echo -e "\e[3;12m For Any Queries Join Me!!!\e[0m"
    echo -e "\e[1;32m           instagram: https://instagram.com/m._adill \e[0m"
    echo -e "\e[1;32m           I AM INDEPTED TO SPEEDX \e[0m"
    echo -e "\e[1;32m           TELEGRAM : t.me/TBombchat \e[0m"
    echo " "
    echo " "
}

init_environ(){
    declare -A backends; backends=(
        ["arch"]="pacman -S --noconfirm"
        ["debian"]="apt-get -y install"
        ["ubuntu"]="apt -y install"
        ["termux"]="apt -y install"
        ["fedora"]="yum -y install"
        ["redhat"]="yum -y install"
        ["SuSE"]="zypper -n install"
        ["sles"]="zypper -n install"
        ["darwin"]="brew install"
        ["alpine"]="apk add"
    )

    INSTALL="${backends[$distro]}"

    if [ "$distro" == "termux" ]; then
        PYTHON="python"
        SUDO=""
    else
        PYTHON="python3"
        SUDO="sudo"
    fi
    PIP="$PYTHON -m pip"
}

install_deps(){

    packages=(openssl git $PYTHON $PYTHON-pip figlet toilet)
    if [ -n "$INSTALL" ];then
        for package in ${packages[@]}; do
            $SUDO $INSTALL $package
        done
        $PIP install -r requirements.txt
    else
        echo "We could not install dependencies."
        echo "Please make sure you have git, python3, pip3 and requirements installed."
        echo "Then you can execute adil.py ."
        exit
    fi
}
detect_distro
init_environ
if [ -f .update ];then
    echo "All Requirements Found...."
else
    echo 'Installing Requirements....'
    echo .
    echo .
    install_deps
    echo This Script Was Made By ADIL > .update
    echo 'Requirements Installed....'
    pause
fi
while :
do
    banner
    echo -e "\e[1;31m Please Read Instruction Carefully !!! \e[0m"
    echo " "
    echo -e "\e[1;32m [1] SMS  Bomber => send sms upto 500\e[0m"
    echo -e "\e[1;32m [2] CALL Bomber => send calls upto 15\e[0m"
    echo -e "\e[1;32m [3] MAIL Bomber => send gmail upto 200\e[0m"
    echo -e "\e[1;32m [99] EXIT \e[0m"
    read ch
    clear
    if [ $ch -eq 1 ];then
   (figlet LOADING....)
        $PYTHON adil.py --sms
        exit
    elif [ $ch -eq 2 ];then
   (figlet LOADING....)
        $PYTHON adil.py --call
        exit
    elif [ $ch -eq 3 ];then
   (figlet LOADING....)
           $PYTHON adil.py --mail
        exit
    elif [ $ch -eq 99 ];then
    banner
    figlet EXIT....
        exit
    else
        (echo -e "\e[4;32m404 ERROR\e[0m" $exit)
        pause
    fi
done