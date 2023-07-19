CREATE database CLINICA;
USE CLINICA;
CREATE TABLE paciente (
  codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT unique,
  nombre VARCHAR(50) NOT NULL,
  apellidos VARCHAR(50) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  poblacion VARCHAR(50) NOT NULL,
  departamento VARCHAR(50) NOT NULL,
  telefono VARCHAR(15) NOT NULL,
  fecha_nacimiento DATE NOT NULL
);

CREATE TABLE medico (
  codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT unique,
  nombre VARCHAR(50) NOT NULL,
  apellidos VARCHAR(50) NOT NULL,
  telefono VARCHAR(15) NOT NULL,
  especialidad VARCHAR(50) NOT NULL
);

CREATE TABLE ingreso (
  codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT unique,
  paciente_codigo INT NOT NULL,
  medico_codigo INT NOT NULL,
  habitacion INT NOT NULL,
  cama INT NOT NULL,
  fecha_ingreso DATETIME NOT NULL,
  FOREIGN KEY (paciente_codigo) REFERENCES paciente (codigo),
  FOREIGN KEY (medico_codigo) REFERENCES medico (codigo)
);
