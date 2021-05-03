show databases ;

create database ejemplo01;
create schema ejemplo01;

use ejemplo01;

# entidad fuerte solo tiene llaves primaria no foranea
create table tipo_documento
(
    sigla  varchar(10),
    estado boolean NOT NULL,
    primary key (sigla)
);

# entidad debil tiene llaves foraneas
create table cliente
(
    numero_documento varchar(40),
    nombres          varchar(100) NOT NULL,
    apellidos        varchar(100) NOT NULL,
    sigla            varchar(10)  NOT NULL,
    primary key (numero_documento),
    constraint fk_tipo_docu_clie foreign key (sigla) references tipo_documento (sigla)
);
