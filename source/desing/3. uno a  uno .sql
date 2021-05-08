# uno a uno no identifiable
create schema ejemplo04;
use ejemplo04;

# relación uno a uno no identificable
CREATE TABLE pedido
(
    numero_pedido int(11)  NOT NULL AUTO_INCREMENT,
    fecha_pedido  datetime NOT NULL,
    constraint pk_pedido PRIMARY KEY (numero_pedido)
);

CREATE TABLE factura
(
    anio           int(11) NOT NULL,
    numero_factura int(11) NOT NULL,
    total_factura  int(11) NOT NULL,
    numero_pedido  int(11) NOT NULL,
    constraint pk_factura PRIMARY KEY (anio,
                                       numero_factura),
    constraint uk_numero_pedido unique (numero_pedido),
    CONSTRAINT fk_pedido FOREIGN KEY (numero_pedido) REFERENCES pedido (numero_pedido)
);

# relación uno a uno identificable

CREATE TABLE cliente
(
    tipo_documento   varchar(20)  NOT NULL,
    numero_documento varchar(100) NOT NULL,
    nombres          varchar(100) NOT NULL,
    apellidos        varchar(100) NOT NULL,
    CONSTRAINT pk_cliente
        PRIMARY KEY (tipo_documento,
                     numero_documento)
);

create table instructor
(
    tipo_documento    varchar(20)  NOT NULL,
    numero_documento  varchar(100) NOT NULL,
    estado_instructor varchar(10)  not null,
    constraint pk_instructor primary key (tipo_documento, numero_documento),
    constraint fk_cliente
        foreign key (tipo_documento, numero_documento)
            references cliente (tipo_documento, numero_documento)
            on UPDATE CASCADE
);

select * from cliente c inner join instructor i
    on c.tipo_documento = i.tipo_documento and c.numero_documento = i.numero_documento;



