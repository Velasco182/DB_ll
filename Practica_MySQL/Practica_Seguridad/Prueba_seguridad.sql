drop schema if EXISTS prueba_seguridad;
create database prueba_seguridad if not EXISTS;

use prueba_seguridad;
create table usuario (idUsuario int auto_increment primary key, 
usuario varchar (50), password varchar(250));
insert into usuario (usuario, password) values
  ("Diego", "123456"),
  ("Tutor1", "ABC789"),
  ("Pedro", "Pp012"),
  ("Maria", "Ma213"),
  ("Camila", "Ca543");