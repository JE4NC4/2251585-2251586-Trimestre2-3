# Muchos a Mucho

## Diseño conceptual

![](../../../.gitbook/assets/image%20%2823%29.png)

En el diseño conceptual se puede expresar con en la imagen anterior pero cuando se va a programar se genera una tablan intermedia o también se coloca en el diseño físico.

##  Diseño Físico

### Llaves naturales

![](../../../.gitbook/assets/image%20%2820%29.png)

```sql
CREATE TABLE factura (
  numero_factura int4 NOT NULL, 
  anio           int4 NOT NULL, 
  forma_pago     varchar(100) NOT NULL, 
  total          float8 NOT NULL, 
  PRIMARY KEY (numero_factura, 
  anio));
  
  CREATE TABLE producto (
  codigo_barras   varchar(255) NOT NULL, 
  nombre_producto varchar(255) NOT NULL, 
  precio          float8 NOT NULL, 
  cantidad        int4 NOT NULL, 
  PRIMARY KEY (codigo_barras));

CREATE TABLE detalle_factura (
  numero_factura int4 NOT NULL, 
  anio_factura   int4 NOT NULL, 
  codigo_barras  varchar(255) NOT NULL, 
  precio         float8 NOT NULL, 
  cantidad       int4 NOT NULL, 
  PRIMARY KEY (numero_factura, 
  anio_factura, 
  codigo_barras));
ALTER TABLE detalle_factura ADD CONSTRAINT fk_factura FOREIGN KEY (numero_factura, anio_factura) REFERENCES factura (numero_factura, anio);
ALTER TABLE detalle_factura ADD CONSTRAINT fk_producto FOREIGN KEY (codigo_barras) REFERENCES producto (codigo_barras);

```

### Llaves sustitutas 

![](../../../.gitbook/assets/image%20%2811%29.png)

```sql
CREATE TABLE factura (
  id             serial NOT NULL, 
  numero_factura int4 NOT NULL, 
  anio           int4 NOT NULL, 
  forma_pago     varchar(100) NOT NULL, 
  total          float8 NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT uc_factura 
    UNIQUE (numero_factura, anio));
    
    
CREATE TABLE producto (
  id              SERIAL NOT NULL, 
  codigo_barras   varchar(255) NOT NULL, 
  nombre_producto varchar(255) NOT NULL, 
  precio          float8 NOT NULL, 
  cantidad        int4 NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT uc_producto 
    UNIQUE (codigo_barras));
    
CREATE TABLE detalle_factura (
  id          SERIAL NOT NULL, 
  id_factura  int4 NOT NULL, 
  id_producto int4 NOT NULL, 
  cantidad    int4 NOT NULL, 
  precio      float8 NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT uc_detalle_factura 
    UNIQUE (id_factura, id_producto));
```

