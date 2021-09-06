--------------------------------------------------------------------------------
--------------------------CREACIÓN DE LA BASE DE DATOS--------------------------
--------------------------------------------------------------------------------

CREATE DATABASE ESCUELATEST

Use ESCUELATEST

--------------------------------------------------------------------------------
--------------------------CREACIÓN DE LA TABLA----------------------------------
--------------------------------------------------------------------------------
SELECT * FROM ALUMNOS;
SELECT * FROM MAESTROS;
SELECT * FROM MATERIAS;
SELECT * FROM PROMEDIOS;

CREATE TABLE ALUMNOS(
AlumnoID int identity(1,1)primary key,
Nombre nvarchar(100)not null,
Appa nvarchar(100)not null,
Apma nvarchar(100)not null,
)
--------------------------------------------------------------------------------
--------------------------CREACIÓN DE LA TABLA----------------------------------
--------------------------------------------------------------------------------

CREATE TABLE MAESTROS(
MaestroID int identity(1,1)primary key,
Nombre nvarchar(100)not null,
Appa nvarchar(100)not null,
Apma nvarchar(100)not null,
)
--------------------------------------------------------------------------------
--------------------------CREACIÓN DE LA TABLA----------------------------------
--------------------------------------------------------------------------------

CREATE TABLE MATERIAS(
MateriasID int identity(1,1)primary key,
materia nvarchar(100)not null,
MaestroID int not null,
CONSTRAINT fk_a FOREIGN KEY (MaestroID) REFERENCES MAESTROS(MaestroID) ON DELETE CASCADE ON UPDATE CASCADE
)
--------------------------------------------------------------------------------
--------------------------CREACIÓN DE LA TABLA----------------------------------
--------------------------------------------------------------------------------

CREATE TABLE PROMEDIOS(
promedioID int identity(1,1)primary key,
calificacion int not null,
AlumnoID int not null,
MateriasID int not null,
CONSTRAINT fk_alu FOREIGN KEY (AlumnoID) REFERENCES ALUMNOS(AlumnoID) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_mat FOREIGN KEY (MateriasID) REFERENCES MATERIAS(MateriasID) ON DELETE CASCADE ON UPDATE CASCADE
)
--------------------------------------------------------------------------------
--------------------------AGREGAR ALUMNOS---------------------------------------
--------------------------------------------------------------------------------
--insert into ALUMNOSNERI(Nombre,Apellido,Calificacion) values('Adolfo','Rivera','Neri');
INSERT INTO ALUMNOS VALUES 
('Adolfo','Rivera','Neri'),
('esteban', 'lopez', 'martiez'),
('saul', 'herrnadez', 'lopez'),
('hugo', 'samora', 'rivera'),
('mateo', 'nuñes', 'ibarra'),
('David', 'matias', 'neg'),
('laura', 'caracas', 'pep'),
('lorena', 'garcia', 'rer'),
('maria', 'melendez', 'user'),
('enrique', 'neri', 'mates'),
('jesus','martinez','mendez'),
('Marco', 'cruz', 'herrnadez'),
('oscar', 'ibarra', 'louse'),
('tadeo', 'castillo', 'huce'),
('ricardo', 'gomez', 'sama'),
('marcos', 'leon', 'eses'),
('yulisa', 'silva', 'hhshs'),
('elton', 'anq', 'tad'),
('matias', 'medel', 'loc'),
('nerd', 'mrte', 'med');

---------------------------------------------------------------------------------
--------------------------AGREGAR MAESTROS---------------------------------------
---------------------------------------------------------------------------------
INSERT INTO MAESTROS VALUES
('Roberto','herrnadez','anguiano'),
('Cristian','lopez','hurtado'),
('Veronica','lopez','garcia');

---------------------------------------------------------------------------------
--------------------------AGREGAR MATERIAS---------------------------------------
---------------------------------------------------------------------------------
INSERT INTO MATERIAS VALUES
 ('SGBD',1),
 ('Programacion',2);
 
---------------------------------------------------------------------------------
--------------------------AGREGAR CALIFIACIONES----------------------------------
---------------------------------------------------------------------------------
INSERT INTO PROMEDIOS VALUES(100);


INSERT INTO PROMEDIOS VALUES 
(98,1,3),
(77,2,4),
(99,3,3),
(70,4,4),
(67,5,3),
(77,6,4),
(88,7,3),
(100,8,4),
(90,9,3),
(90,10,4),
(67,11,3),
(67,12,4),
(87,13,3),
(67,14,4),
(89,15,3),
(67,16,4),
(80,17,3),
(67,18,4),
(60,19,3),
(67,20,4);
---------------------------------------------------------------------------------
--------------------------CONSULTA LOS 10 MEJORES--------------------------------
---------------------------------------------------------------------------------

SELECT TOP 10 A.nombre as Nombre,
	   A.Appa as Apellido_p,
	   A.Apma as Apellido_m,
	   AVG(C.calificacion) AS Promedio
   FROM ALUMNOS A,
  	   PROMEDIOS C
 WHERE C.AlumnoID= A.AlumnoID
 GROUP BY  A.Nombre,A.Appa,A.Apma
 ORDER BY AVG(C.calificacion) DESC
 