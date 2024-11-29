create database El_Univercitario;

use El_Univercitario;

create table alumno( 
id int primary key not null, 
nif varchar(9),
nombre varchar(25) not null,
apellido1 varchar(50) not null,
apellido2 varchar(50),
ciudad varchar(25) not null,
direccion varchar(50) not null,
telefono varchar(9),
fecha_nacimineto date not null,
sexo  ENUM('H', 'M') not null
 );
 
 
create table curso_escolar(
id int primary key not null,
anyo_inicio year(4) not null,
anyo_fin year(4) not null
);

create table departamento(
id int primary key not null,
nombre varchar(50) not null
);

create table profesor(
id int primary key not null,
nif varchar(9),
nombre varchar(25) not null,
apellido1 varchar(50) not null,
apellido2 varchar(50),
ciudad varchar(25)not null,
direccion varchar(50) not null,
telefono varchar(9),
fecha_nacimineto date not null,
sexo enum('H', 'M') not null,
id_departamento int(10) not null,
foreign key (id_departamento) references departamento(id)
);

create table grado(
id int primary key not null,
nombre varchar(100) not null
);

create table asignatura(
id int primary key not null,
nombre varchar (100) not null,
credito float not null,
tipo enum('básica', 'obligatoria', 'optativa') not null,
curso tinyint(3) not null,
cauatrimestre tinyint(3) not null,
id_profesor int(10),
id_grado int(10) not null,
foreign key (id_profesor) references profesor(id),
foreign key (id_grado) references grado(id)
);

create table alumno_se_matricula_asignatura(
id_alumno int(10),
id_asignatura int(10),
id_curso_escolar int(10),
foreign key (id_alumno) references alumno(id),
foreign key (id_asignatura) references asignatura(id),
foreign key (id_curso_escolar) references curso_escolar(id)
);