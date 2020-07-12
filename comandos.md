Autor: Ing. Martin Acosta - 2020
# POSTGRESQL + PGADMIN4 🐘
## Descripción 📋
Pasos para la creación de tablas, carga de datos y establecimiento de restricciones en PostgreSQL, utilizando pgAdmin4.
## Correr la aplicación 🚀
Para ejecutar los comandos, se debe utilizar el Query Tool de pgAdmin4. Una vez iniciado, copiar y pegar cada uno de los comandos y correrlas.
### Creo la tabla usuarios
```sh
CREATE TABLE usuarios(
	user_id integer,
	user_name character varying(20),
	user_email character varying(20)
);
```
### Cargo los datos en la tabla usuarios
```sh
INSERT INTO usuarios(user_id,user_name,user_email)
	VALUES(1,'Juan Perez','juan@gmail.com');
INSERT INTO usuarios(user_id,user_name,user_email)
	VALUES(2,'Carlos Gimenez','carlos@yahoo.com');
INSERT INTO usuarios(user_id,user_name,user_email)
	VALUES(3,'Cecilia Parra','ceci_p@gmail.com');
```
### Modifico la tabla para generar el id autoincremental y asignarlo como llave primaria
```sh
CREATE SEQUENCE user_seq 
	START 3 
	INCREMENT 1;
ALTER TABLE usuarios
	ALTER COLUMN user_id SET DEFAULT nextval('user_seq');
ALTER TABLE usuarios ADD PRIMARY KEY (user_id);
```
### Creo la tabla fincas
```sh
CREATE TABLE fincas(
	finca_id serial,
	finca_name varchar(20),
	finca_pos varchar(20),
	finca_cultivo varchar(20),
	finca_user_id integer,
	primary key (finca_id)	
);
```
### Cargo los datos en la tabla fincas
```sh
INSERT INTO fincas(finca_name,finca_pos,finca_cultivo,finca_user_id)
	VALUES('La Soñada','Catamarca','Uvas',3);
INSERT INTO fincas(finca_name,finca_pos,finca_cultivo,finca_user_id)
	VALUES('El Paraiso','La Rioja','Olivos',2);
INSERT INTO fincas(finca_name,finca_pos,finca_cultivo,finca_user_id)
	VALUES('Las Margaritas','Mendoza','Uvas',1);
INSERT INTO fincas(finca_name,finca_pos,finca_cultivo,finca_user_id)
	VALUES('El Parral','Catamarca','Uvas',3);
```
### Creo la tabla dispositivos
```sh
CREATE TABLE dispositivos(
	dev_id serial,
	dev_tipo varchar(20),
	dev_sector integer,
	dev_finca_id integer,
	primary key (dev_id)
);
```
### Cargo los datos en la tabla dispositivos
```sh
INSERT INTO dispositivos(dev_tipo,dev_sector,dev_finca_id)
	VALUES ('sensor',1,1);
INSERT INTO dispositivos(dev_tipo,dev_sector,dev_finca_id)
	VALUES ('sensor',3,2);
INSERT INTO dispositivos(dev_tipo,dev_sector,dev_finca_id)
	VALUES ('actuador',1,1);
INSERT INTO dispositivos(dev_tipo,dev_sector,dev_finca_id)
	VALUES ('sensor',2,3);
INSERT INTO dispositivos(dev_tipo,dev_sector,dev_finca_id)
	VALUES ('actuador',2,2);
INSERT INTO dispositivos(dev_tipo,dev_sector,dev_finca_id)
	VALUES ('sensor',4,3);
```
### Creo la tabla datos
```sh
CREATE TABLE datos(
	data_id serial,
	data_tipo varchar(20),
	data_time timestamp,
	data_valor float,
	data_dev_id integer,
	primary key (data_id)
);
```
### Cargo los datos a la tabla datos
```sh
INSERT INTO datos (data_tipo,data_time,data_valor,data_dev_id)
	VALUES ('humedad','2020/7/11 20:56:32.14',10.2,1);
INSERT INTO datos (data_tipo,data_time,data_valor,data_dev_id)
	VALUES ('humedad','2020/7/11 21:56:32.14',10.3,1);
INSERT INTO datos (data_tipo,data_time,data_valor,data_dev_id)
	VALUES ('humedad','2020/7/11 22:56:32.14',10.2,1);
INSERT INTO datos (data_tipo,data_time,data_valor,data_dev_id)
	VALUES ('conductividad','2020/7/11 22:15:32.14',1.32,3);
INSERT INTO datos (data_tipo,data_time,data_valor,data_dev_id)
	VALUES ('conductividad','2020/7/11 22:17:32.14',1.43,2);
INSERT INTO datos (data_tipo,data_time,data_valor,data_dev_id)
	VALUES ('humedad','2020/7/11 22:21:32.14',10.5,6);
INSERT INTO datos (data_tipo,data_time,data_valor,data_dev_id)
	VALUES ('temperatura','2020/7/11 22:22:32.14',10.3,4);
INSERT INTO datos (data_tipo,data_time,data_valor,data_dev_id)
	VALUES ('humedad','2020/7/11 22:56:32.14',10.3,2);
INSERT INTO datos (data_tipo,data_time,data_valor,data_dev_id)
	VALUES ('temperatura','2020/7/11 23:14:32.14',21,2);
INSERT INTO datos (data_tipo,data_time,data_valor,data_dev_id)
	VALUES ('conductividad','2020/7/11 23:56:32.14',1.5,3);
```
### Añado una restricción con una clave foránea para la tabla fincas
```sh
ALTER TABLE fincas
	ADD CONSTRAINT restriccion_finca
	FOREIGN KEY (finca_user_id)
	REFERENCES usuarios (user_id);
```
### Añado una restricción con una clave foránea para la tabla dispositivos
```sh
ALTER TABLE dispositivos
	ADD CONSTRAINT restriccion_disp
	FOREIGN KEY (dev_finca_id)
	REFERENCES fincas (finca_id);
```
### Añado una restricción con una clave foránea para la tabla datos
```sh
ALTER TABLE datos
	ADD CONSTRAINT restriccion_datos
	FOREIGN KEY (data_dev_id)
	REFERENCES dispositivos (dev_id);
```
### Muestro una tabla con todos los datos de todas las tablas relacionadas
```sh
SELECT usuarios.*,fincas.*,dispositivos.*,datos.* 
	FROM usuarios
	INNER JOIN fincas
	ON fincas.finca_user_id = usuarios.user_id
	INNER JOIN dispositivos
	ON dispositivos.dev_finca_id = fincas.finca_id
	INNER JOIN datos
	ON datos.data_dev_id = dispositivos.dev_id;
```
