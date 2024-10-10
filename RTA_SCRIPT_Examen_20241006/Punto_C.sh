#!/bin/bash

sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores

sudo useradd -U -G p1c2_2024_gAlumno -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')" p1c2_2024_A1
sudo useradd -U -G p1c2_2024_gAlumno -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')" p1c2_2024_A2
sudo useradd -U -G p1c2_2024_gAlumno -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')" p1c2_2024_A3
sudo useradd -U -G p1c2_2024_gProfesores -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')" p1c2_2024_P1

chown -R p1c2_2024_A1:p1c2_2024_A1 /Examenes-UTN/alumno_1/
chown -R p1c2_2024_A2:p1c2_2024_A2 /Examenes-UTN/alumno_2/
chown -R p1c2_2024_A3:p1c2_2024_A3 /Examenes-UTN/alumno_3/
chown -R p1c2_2024_P1:p1c2_2024_gProfesores /Examenes-UTN/profesores/

sudo chmod -R 750 /Examenes-UTN/alumno_1
sudo chmod -R 760 /Examenes-UTN/alumno_2
sudo chmod -R 700 /Examenes-UTN/alumno_3
sudo chmod -R 775 /Examenes-UTN/profesores

sudo su -c "whoami > /Examenes-UTN/alumno_1/validar1.txt" p1c2_2024_A1
sudo su -c "whoami > /Examenes-UTN/alumno_2/validar1.txt" p1c2_2024_A2
sudo su -c "whoami > /Examenes-UTN/alumno_3/validar1.txt" p1c2_2024_A3
sudo su -c "whoami > /Examenes-UTN/profesores/validar1.txt" p1c2_2024_P1
