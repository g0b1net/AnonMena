#!/bin/bash
end="\033[0m\e[0m"
blue="\e[0;34m\033[1m"

echo -e "${blue}AnonMena, ser anonimo y del colmena, o no se estoy solo y triste${end}"
echo -e "${blue}Sigueme en youtube: https://www.youtube.com/watch?v=dQw4w9WgXcQ${end}"

trap ctrl_c INT

function ctrl_c(){
	echo -e "\n${blue}[*] Saliendo y borrando logs...\n${end}"
	echo "" > /$USER/.bash_history
	exit 0
}

function services(){
	echo -e "\n${blue}[*] Iniciando servicios....\n${end}"
	service tor start
}

function dependencias(){
	echo -e "\n${blue}[*] Verificando e instalando.....\n${end}"
	sudo apt-get update
	sudo apt-get install tor
	sudo apt-get install proxychains
	sudo apt-get install python3	
}

function change_ip(){
	service tor reload
}

function ip(){
	echo -e "\n${blue}[*] Mostrando tu IP publica...\n${end}"
	sleep 3
	python3 ip.py
	echo -e "\n${blue}[*] Nice IP bro :) \n${end}"
}

function bucle(){
	i=0
while [ $i -lt 1000000 ]
do
    sleep 13m
    change_ip
    ((i++))
done
}

if [ "$(id -u)" == "0" ]; then
	dependencias
	services
	ip
	bucle
    else
	 echo -e "\n${blue}[!] Ponte root webon ahora vuelves\n${end}"
	 exit 1
fi

#que hace leyendo aca

