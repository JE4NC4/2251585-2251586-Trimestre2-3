create schema ejemplo02;
use ejemplo02;
# llave primaria simple
create table tipo_documento
(
    sigla            varchar(10) primary key,
    nombre_documento varchar(100),
    estado           varchar(40)
);

drop table ejemplo02.tipo_documento;

create table tipo_documento
(
    sigla            varchar(10),
    nombre_documento varchar(100),
    estado           varchar(40),
    primary key (sigla)
);

# llave primaria compuesta

create table factura
(
    anio_factura   int,
    numero_factura int,
    total          double,
    primary key (anio_factura, numero_factura)
);

#llave primaria natural y compuesta
create table estudiante
(
    tipo_documento   varchar(10), # 11 bytes
    numero_documento varchar(50), # 51 bytes
    nombres          varchar(200) not null ,
    apellidos        varchar(200) not null ,
    password         varchar(256) NOT NULL ,
    primary key (tipo_documento, numero_documento)
);

#llave primaria sustituta desnormalizando para mejorar el performance
create table estudiante2
(
    id               int auto_increment,      # 4 bytes
    tipo_documento   varchar(10) not null ,             # 11 bytes
    numero_documento varchar(50) not null ,             # 51 bytes
    nombres          varchar(200),
    apellidos        varchar(200),
    password         varchar(256),
    primary key (id),
    unique (tipo_documento, numero_documento) # 62 bytes insert, update
);
drop table estudiante2;

create schema ejemplo03;
use ejemplo03;

create table curso(
    ficha int,
    cantidad_estudiantes int not null,
    estado varchar(40) not null ,
    primary key (ficha)
);

create table estudiante(
    tipo_documento varchar(10) not null,
    numero_documento varchar(50) not null,
    nombres varchar(200) not null ,
    apellidos varchar(200) not null ,
    password varchar(256) not null ,
    ficha int not null,
    constraint pk_estudiante primary key (tipo_documento, numero_documento),
    constraint fk_curso foreign key (ficha) references curso(ficha)
);