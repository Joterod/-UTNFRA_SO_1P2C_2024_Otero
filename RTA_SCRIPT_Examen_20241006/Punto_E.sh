ARCHIVO=~/repogit/UTNFRA_SO_1P2C_2024_Otero/RTA_ARCHIVOS_Examen_20241006/Filtro_Basico.txt 
touch $ARCHIVO
cat /proc/meminfo | head -1 > $ARCHIVO 
sudo dmidecode -t chassis | grep Chassis -A1 >> $ARCHIVO 
