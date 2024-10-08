IP_PUBLICA=$(curl -s ifconfig.me)
HASH_USUARIO=$(sudo grep $(whoami) /etc/shadow | awk -F ':' '{print $2}')
GIT_URL=$(cd ~/repogit/UTNFRA* && git remote get-url origin)
ARCHIVO=~/repogit/UTNFRA_SO_1P2C_2024_Otero/RTA_ARCHIVOS_Examen_20241006/Filtro_Avanzado.txt


echo "Mi IP Publica es: $IP_PUBLICA" > $ARCHIVO 
echo "Mi usuario es: $USER" >> $ARCHIVO
echo "El Hash de mi Usuario es: $HASH_USUARIO" >> $ARCHIVO
echo "La URL de mi repositorio es: $GIT_URL" >> $ARCHIVO
