# Uno a Muchos

## Uno a muchos NO identificable

![](../../../.gitbook/assets/image%20%2813%29.png)

```sql
CREATE TABLE nivel_formacion (
  nivel  varchar(40) NOT NULL, 
  estado varchar(40) NOT NULL, 
  PRIMARY KEY (nivel));


CREATE TABLE programa (
  codigo  varchar(50) NOT NULL, 
  version varchar(40) NOT NULL, 
  nombre  varchar(500) NOT NULL, 
  sigla   varchar(40) NOT NULL, 
  estado  varchar(40) NOT NULL, 
  nivel   varchar(40) NOT NULL, 
  PRIMARY KEY (codigo, 
  version));
ALTER TABLE programa ADD CONSTRAINT fk_nifo_prog FOREIGN KEY (nivel) REFERENCES nivel_formacion (nivel);
```

## Uno a mucho identificable

![](../../../.gitbook/assets/image%20%2812%29.png)

```sql
CREATE TABLE tipo_documento (
  sigla            varchar(10) NOT NULL, 
  nombre_documento varchar(100) NOT NULL UNIQUE, 
  estado           varchar(40) NOT NULL, 
  CONSTRAINT pk_tipo_documento 
    PRIMARY KEY (sigla));
	
	CREATE TABLE cliente (
  numero_documento varchar(50) NOT NULL, 
  sigla            varchar(10) NOT NULL, 
  primer_nombre    varchar(50) NOT NULL, 
  segundo_nombre   varchar(50), 
  primer_apellido  varchar(50) NOT NULL, 
  segundo_apellido varchar(50), 
  login            varchar(50) NOT NULL UNIQUE, 
  CONSTRAINT pk_cliente 
    PRIMARY KEY (numero_documento, 
  sigla));
	ALTER TABLE cliente ADD CONSTRAINT fk_tipo_documento FOREIGN KEY (sigla) REFERENCES tipo_documento (sigla);
```

## Uno a mucho recursiva no identificable

![](../../../.gitbook/assets/image%20%2831%29.png)

```sql
CREATE TABLE categoria (
  numero_categoria SERIAL NOT NULL, 
  categoria_padre  int4 NOT NULL, 
  nombre_categoria varchar(100) NOT NULL, 
  PRIMARY KEY (numero_categoria));
ALTER TABLE categoria ADD CONSTRAINT fk_categoria FOREIGN KEY (categoria_padre) REFERENCES categoria (numero_categoria):

```

## Uno a mucho recursiva identificable

No EXISTE no se puede hacer, genera problemas en el motor

