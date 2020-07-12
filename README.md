Autor: Ing. Martin Acosta - 2020
# POSTGRESQL + PGADMIN4 🐘
## Descripción 📋
El script se encarga de descargar y ejecutar contenedores de las imagenes oficiales de [PostgreSQL](https://www.postgresql.org/), y [pgAdmin4](https://www.pgadmin.org/) para el manejo de bases de datos relacionales a través de un navegador web.
Además posee persistencia de los datos y las configuraciones realizadas en el gestor de la base de datos.
## Captura de la aplicación 📸
![pgadmin4](https://i.ibb.co/ZL9Fvrk/postgres-screen.png)
## Pre-requisitos 📦
Para ejecutar el proyecto es necesario contar con una instalación de Docker. En caso de no ser así, puede encontrar una introducción a [Docker](https://iot-es.herokuapp.com/post/details/2) y su respectivo proceso de instalación.
## Correr la aplicación 🚀
Para correr la aplicación deberá clonar o descargar el repositorio e ingresar a la carpeta del proyecto:
```sh
git clone https://github.com/javosmar/postgres
cd postgres
```
Una vez dentro de la carpeta se debe ejecutar el script con los respectivos permisos de ejecución
```sh
chmod +x postgres.sh
./postgres.sh
```
Al ejecutar el script se generarán los archivos propios de la base de datos y del gestor para persistir los datos luego de detener los contenedores.


Con los contenedores corriendo deberá ingresar desde su navegador web a la siguiente dirección.
```sh
http://localhost:5050
```
![acceso pgadmin4](https://i.ibb.co/xzVKVWM/postgres-login.png)
Una vez desplegada la pantalla de bienvenida, se debe ingresar utilizando las credenciales por defecto
```sh
user: postgres
pass: userpass
```
Para verificar la dirección IP del contenedor de PostgreSQL, se puede utilizar el siguiente comando
```sh
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' postgres-db
```
## Terminar la ejecución ⏹
Para detener los contenedores se debe utilizar el comando de docker
```sh
docker stop postgres-db
docker stop pgadmin
```
## Construido con 🛠️
* [Docker](https://www.docker.com/)
## Contribuir 🖇️
Para contribuir realizar un pull request con las sugerencias.
## Licencia 📄
GPL
