DISCO=$(sudo fdisk -l | grep "10 GiB" | awk {'print$2'} | awk -F : {'print$1'})

echo "El disco esta ubicado en $DISCO, vamos a particionarlo!"

sudo fdisk $DISCO << EOF
n
p


+2078720
n
p


+2078720
n
p


+2078720
n
e


n

+2078720
n

+2078720
n

+2078720
n

+2078720
n

+2078720
n

+2078720
n

+2078720
w
EOF
echo "Le damos formato a las particiones!!"
sudo fdisk -l $DISCO |grep $DISCO |grep -vi 'Disk' | grep -vi 'Extended' | awk '{print"sudo mkfs.ext4 "$1}'|/bin/bash
echo 
echo "Ahora montamos las particiones carpetas en las carpetas solicitadas"

sudo mount ${DISCO}1 /Examenes-UTN/alumno_1/parcial_1/
sudo mount ${DISCO}2 /Examenes-UTN//alumno_1/parcial_2/
sudo mount ${DISCO}3 /Examenes-UTN//alumno_1/parcial_3/
sudo mount ${DISCO}5 /Examenes-UTN//alumno_2/parcial_1/
sudo mount ${DISCO}6 /Examenes-UTN//alumno_2/parcial_2/
sudo mount ${DISCO}7 /Examenes-UTN//alumno_2/parcial_3/
sudo mount ${DISCO}8 /Examenes-UTN//alumno_3/parcial_1/
sudo mount ${DISCO}9 /Examenes-UTN//alumno_3/parcial_2/
sudo mount ${DISCO}10 /Examenes-UTN//alumno_3/parcial_3/
sudo mount ${DISCO}11 /Examenes-UTN//profesores/
echo "Particiones montadas, ahora las hacemos permanentes"
echo "${DISCO}1 /Examenes-UTN/alumno_1/parcial_1/ ext4 defaults 0 0
${DISCO}2 /Examenes-UTN/alumno_1/parcial_2/ ext4 defaults 0 0
${DISCO}3 /Examenes-UTN/alumno_1/parcial_3/ ext4 defaults 0 0
${DISCO}5 /Examenes-UTN/alumno_2/parcial_1/ ext4 defaults 0 0
${DISCO}6 /Examenes-UTN/alumno_2/parcial_2/ ext4 defaults 0 0
${DISCO}7 /Examenes-UTN/alumno_2/parcial_3/ ext4 defaults 0 0
${DISCO}8 /Examenes-UTN/alumno_3/parcial_1/ ext4 defaults 0 0
${DISCO}9 /Examenes-UTN/alumno_3/parcial_2/ ext4 defaults 0 0
${DISCO}10 /Examenes-UTN/alumno_3/parcial_3/ ext4 defaults 0 0
${DISCO}11 /Examenes-UTN/profesores/ ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "Discos montados"
