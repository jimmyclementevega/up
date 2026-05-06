--version
print @@version

--creando una base de datos de forma predeterminada.
use master
go

CREATE DATABASE BDRENIEC2026
GO

--VALIDANDO LA BD
SP_HELPDB BDRENIEC2026


--crear bd con parametros
CREATE DATABASE BDJNE2026
ON(NAME= BDJNE2026_DATA, FILENAME='D:\DATOS\BDRENIEC2026_DATA.mdf',
 SIZE=10,MAXSIZE=100,FILEGROWTH=2)
LOG ON(NAME= BDJNE2026_LOG, FILENAME='D:\DATOS\BDRENIEC2026_LOG.Ldf',
 SIZE=20,MAXSIZE=200,FILEGROWTH=10%)
 go
 SP_HELPDB BDJNE2026
 go
 --creando tablas
 --primero activar la base de datos 

 use BDJNE2026
 GO

 --CREAR LA TABLA CANTIDAD
 CREATE TABLE CANDIDATO
 (idcandidato INT NOT NULL,
 nombrecand VARCHAR(50) NOT NULL,
 apellido VARCHAR(100)NOT NULL,
 genero CHAR(1) NOT NULL

 )
 go 
 
 SP_HELP CANDIDATO

 --AGREGANDO LA PK 
 ALTER TABLE CANDIDATO
 ADD PRIMARY KEY(idcandidato)
 go
 --agregar correo 
  ALTER TABLE CANDIDATO
 ADD correo varchar(5)not null
 go
 --crear tabla de partido politico
 DROP TABLE PARTIDOPOL
 CREATE TABLE PARTIDOPOL
 (cod_partido INT PRIMARY KEY,
 NOMBREPAR VARCHAR(25) NOT NULL
 )
 GO
 SP_HELP PARTIDOPOL
 GO
 --AGREGAR LA LLAVE FK
 ALTER TABLE CANDIDATO
 ADD cod_partido INT REFERENCES PARTIDOPOL
 GO
 SP_HELP CANDIDATO


