#! /bin/bash
#https://github.com/FJBERNI/Practica16
if [[ ${UID} -ne 0 ]]
then
	echo "Debes ser root para ejecutar este script."
	exit 1
else
	IP=$(cat $1 | grep 'password' | awk '{print $11}' | sort -t . | tr -d [:alpha:] | grep [.*] | uniq -c | sort -g | tail -n +2 | awk '{print $2}')
	Cuenta=$(cat $1 | grep 'password' | awk '{print $11}' | sort -t . | tr -d [:alpha:] | grep [.*] | uniq -c | sort -g | tail -n +2 | awk '{print $1}' )
	
	
	for i in $IP
	do
	Pais=$(geoiplookup $i |awk  '{print $5}' )
	
	echo "$i,$Pais"	>> filter.txt
	done
	

fi
