# Uno a Uno

## Uno a uno NO IDENTIFICABLE

![](../../../.gitbook/assets/image%20%281%29.png)

```sql
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
```

## Uno a uno IDENTIFICABLE

![](../../../.gitbook/assets/image%20%2826%29.png)

```sql
CREATE TABLE ejemplo04.cliente (
  tipo_documento   varchar(20) NOT NULL, 
  numero_documento varchar(50) NOT NULL, 
  nombres          varchar(100) NOT NULL, 
  apellidos        varchar(100) NOT NULL, 
  estado           varchar(20) NOT NULL, 
  PRIMARY KEY (tipo_documento, 
  numero_documento));

CREATE TABLE ejemplo04.instructor (
  tipo_documento    varchar(20) NOT NULL, 
  numero_documento  varchar(50) NOT NULL, 
  estado_instructor varchar(20) NOT NULL, 
  PRIMARY KEY (tipo_documento, 
  numero_documento));
ALTER TABLE ejemplo04.instructor ADD CONSTRAINT fk_cliente FOREIGN KEY (tipo_documento, numero_documento) REFERENCES ejemplo04.cliente (tipo_documento, numero_documento);

```

## Uno a Uno recursiva

![](../../../.gitbook/assets/image%20%2822%29.png)

```sql
CREATE TABLE categoria (
  numero_categoria SERIAL NOT NULL, 
  categoria_padre  int4 NOT NULL, 
  nombre_categoria varchar(100) NOT NULL, 
  PRIMARY KEY (numero_categoria));
ALTER TABLE categoria ADD CONSTRAINT fk_categoria FOREIGN KEY (categoria_padre) REFERENCES categoria (numero_categoria);
```

Nota: el código de este diseño es equivalente al siguiente, por tal motivo es mejor usar el siguiente ya que el diseño no tendría lógica.

![](../../../.gitbook/assets/image%20%2834%29.png)

```sql
CREATE TABLE categoria (
  numero_categoria SERIAL NOT NULL, 
  categoria_padre  int4 NOT NULL, 
  nombre_categoria varchar(100) NOT NULL, 
  PRIMARY KEY (numero_categoria));
ALTER TABLE categoria ADD CONSTRAINT fk_categoria FOREIGN KEY (categoria_padre) REFERENCES categoria (numero_categoria):

```

