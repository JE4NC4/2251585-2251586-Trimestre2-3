/*
 DML data definition lenguaje
 sirve para hacer hacer la estructura del diseño
 */

/*
crear base de datos
*/
create database ejemplos;

/*
 create esquema
 */
create schema ejemplos01;

/* crear tablas */
CREATE TABLE ejemplo02.products
(
    product_no integer,
    name       text,
    price      numeric
);
/* borrar una base de datos */
drop table ejemplo02.products;

/* Default Values */
CREATE TABLE ejemplo02.products
(
    product_no integer,
    name       text,
    price      numeric DEFAULT 9.99
);

insert into ejemplo02.products
values (1, 'coca cola');
select *
from ejemplo02.products;

CREATE TABLE ejemplo02.products
(
    product_no serial,
    name       text,
    price      numeric DEFAULT 9.99
);

insert into ejemplo02.products(name)
values ('coca cola');
select *
from ejemplo02.products;

CREATE SEQUENCE ejemplo02.products_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

CREATE TABLE ejemplo02.products
(
    product_no integer NOT NULL DEFAULT nextval('ejemplo02.products_seq'::regclass),
    name       text,
    price      numeric          DEFAULT 9.99
);
drop table ejemplo02.products;
drop sequence ejemplo02.products_seq;

/* Generated Columns */
CREATE TABLE ejemplo02.people
(
    id        int,
    height_cm numeric,
    height_in numeric GENERATED ALWAYS AS (height_cm / 2.54) STORED
);

insert into ejemplo02.people(id, height_cm)
values (1, 184);
select *
from ejemplo02.people;

/**
  constrains
 */
/* check contrains con un nombre por default*/
drop table ejemplo02.products;
CREATE TABLE ejemplo02.products
(
    product_no integer,
    name       text,
    price      numeric CHECK (price > 0)
);
insert into ejemplo02.products (product_no, name, price)
values (1, 'papa super ricas', -20);

/* check contrains con un nombre personalizado*/
drop table ejemplo02.products;
CREATE TABLE ejemplo02.products
(
    product_no integer,
    name       text,
    price      numeric
        constraint ch_price CHECK (price > 0)
);
insert into ejemplo02.products (product_no, name, price)
values (1, 'papa super ricas', -20);

/* Not-Null Constraints */
create table ejemplo02.cliente
(
    tipo_documento   varchar(20)  not null,
    numero_documento varchar(50)  not null,
    primer_nombre    varchar(100) not null,
    segundo_nombre   varchar(100),
    primer_apellido  varchar(100) not null,
    segundo_apelligo varchar(100)
);
INSERT Into ejemplo02.cliente (tipo_documento, numero_documento, primer_nombre, primer_apellido,
                               segundo_apelligo)
values ('CC', '12345', 'Carlos', 'Martinez', null);
select *
from ejemplo02.cliente;

/*
    unique constraint
*/
/* unique constraint con el nombre por default*/
create table ejemplo02.tipo_documento
(
    sigla  varchar(20) unique,
    nombre varchar(50)
);
insert into ejemplo02.tipo_documento(sigla, nombre)
values ('CC', 'cédula de ciudadanía');
drop table ejemplo02.tipo_documento;

/* unique constraint con el nombre por default*/
create table ejemplo02.tipo_documento
(
    sigla  varchar(20),
    nombre varchar(50),
    constraint uc_sigla unique (sigla)
);
insert into ejemplo02.tipo_documento(sigla, nombre)
values ('CC', 'cédula de ciudadanía');

/* unique constraint composite / restrinción de uniciddd compuesta*/
drop table ejemplo02.cliente;
create table ejemplo02.cliente
(
    tipo_documento   varchar(20)  not null,
    numero_documento varchar(50)  not null,
    primer_nombre    varchar(100) not null,
    segundo_nombre   varchar(100),
    primer_apellido  varchar(100) not null,
    segundo_apelligo varchar(100),
    constraint uc_cliente unique (tipo_documento, numero_documento)
);
INSERT Into ejemplo02.cliente (tipo_documento, numero_documento, primer_nombre, primer_apellido,
                               segundo_apelligo)
values ('CE', '12345', 'Carlos', 'Martinez', null);
select *
from ejemplo02.cliente;

/* Primary Keys */

/* simples */
drop table ejemplo02.products;
CREATE TABLE ejemplo02.products
(
    product_no integer PRIMARY KEY,
    name       text,
    price      numeric
);
/* personalizando el nombre del contraint*/
CREATE TABLE ejemplo02.products
(
    product_no integer,
    name       text,
    price      numeric,
    constraint pk_products primary key (product_no)
);

/* llave primaria compuesta */
drop table ejemplo02.cliente;
create table ejemplo02.cliente
(
    tipo_documento   varchar(20)  not null,
    numero_documento varchar(50)  not null,
    primer_nombre    varchar(100) not null,
    segundo_nombre   varchar(100),
    primer_apellido  varchar(100) not null,
    segundo_apelligo varchar(100),
    constraint pk_cliente primary key (tipo_documento, numero_documento)
);
INSERT Into ejemplo02.cliente (tipo_documento, numero_documento, primer_nombre, primer_apellido,
                               segundo_apelligo)
values ('CC', '12345', 'Carlos', 'Martinez', null);
select *
from ejemplo02.cliente;

/* Foreign Keys */
drop table ejemplo02.tipo_documento;
create table ejemplo02.tipo_documento
(
    sigla            varchar(10)  not null,
    nombre_documento varchar(100) not null,
    estado           varchar(40)  not null,
    constraint uc_nombre_documento unique (nombre_documento),
    constraint pk_tipo_documento primary key (sigla)
);

create table ejemplo02.user
(
    login          varchar(50)  not null,
    password       varchar(60)  not null,
    email          varchar(254) not null,
    activated      int          not null,
    lang_key       varchar(6)   not null,
    image_url      varchar(256),
    activation_key varchar(20),
    reset_key      varchar(20),
    reset_day      timestamp,
    constraint pk_user primary key (login),
    constraint uc_email unique (email)
);

create table ejemplo02.cliente
(
    numero_documento varchar(50) not null,
    primer_nombre    varchar(50) not null,
    segundo_nombre   varchar(50) null,
    primer_apellido  varchar(50) not null,
    segundo_apellido varchar(50) null,
    sigla            varchar(10) not null,
    login            varchar(50) not null,
    constraint pk_cliente primary key (sigla, numero_documento),
    constraint fk_tipo_documento foreign key (sigla) references ejemplo02.tipo_documento (sigla)
        on UPDATE cascade on DELETE restrict,
    constraint fk_user foreign key (login) references ejemplo02.user (login)
        on UPDATE CASCADE on DELETE RESTRICT,
    constraint uc_login unique (login)
);

insert into ejemplo02.user (login, password, email, activated, lang_key)
values ('pepito', '123456789', 'pepito@gmail.com', 1, 'es');

insert into ejemplo02.tipo_documento (sigla, nombre_documento, estado)
values ('CC', 'Cédula de ciudadanía', 'activo');

insert into ejemplo02.cliente (numero_documento, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido,
                               sigla, login)
values ('123547851', 'juan', 'andres', 'morales', 'garzon', 'CC', 'pepito');

update ejemplo02.tipo_documento c
set sigla = 'CCC'
where c.sigla = 'CC';

 /**
 NOTA: en mysql para las llaves foraneas compuestas toca ponerlas en mismo orden del indice
   para eso se usa el siguiente comando
    show index from ficha_has_trimestre;
*/








