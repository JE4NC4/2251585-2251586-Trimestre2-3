# Tipos de llaves

## Llaves Primarias

En el diseño de [bases de datos relacionales](https://es.wikipedia.org/wiki/Base_de_datos_relacional), se llama **clave primaria** o **clave principal** a un campo o a una combinación de campos que identifica de forma única a cada [fila](https://es.wikipedia.org/wiki/Registro_%28base_de_datos%29) de una [tabla](https://es.wikipedia.org/wiki/Tabla_%28base_de_datos%29). Una clave primaria comprende de esta manera una [columna](https://es.wikipedia.org/wiki/Columna_%28base_de_datos%29) o conjunto de columnas. No puede haber dos filas en una tabla que tengan la misma clave primaria.

[https://es.wikipedia.org/wiki/Clave\_primaria](https://es.wikipedia.org/wiki/Clave_primaria)

### Llaves primarias simples

Primary Keys pueden ser simples \(o sea, una sola columna actúa como Primary Key\).

![](../../.gitbook/assets/image%20%283%29.png)

```sql
create table tipo_documento
(
    sigla            varchar(10) primary key,
    nombre_documento varchar(100),
    estado           varchar(40)
);
```

### Llaves primarias compuestas

Primary Keys pueden ser compuestas \(o sea, dos o más columnas actúan como Primary Key\).

![](../../.gitbook/assets/image%20%288%29.png)

```sql
create table factura(
    anio_factura int,
    numero_factura int,
    total double,
    primary key (anio_factura, numero_factura)
);
```

### Llaves primarias Naturales\( **business key o**  **domain key\)**

{% embed url="https://en.wikipedia.org/wiki/Natural\_key" %}

![](../../.gitbook/assets/image%20%282%29.png)

```sql
create table estudiante(
    tipo_documento varchar(10),
    numero_documento varchar(50),
    nombres varchar(200),
    apellidos varchar(200),
    password varchar(256),
    primary key (tipo_documento, numero_documento)
);
```

### Llaves primarias sustitutas\(surrogates key o subrogada\)

{% embed url="https://en.wikipedia.org/wiki/Surrogate\_key" %}

{% embed url="https://www.mssqltips.com/sqlservertip/5431/surrogate-key-vs-natural-key-differences-and-when-to-use-in-sql-server/" %}

![](../../.gitbook/assets/image%20%286%29.png)

```sql
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
```

## Llaves Foráneas

{% embed url="https://es.wikipedia.org/wiki/Clave\_for%C3%A1nea" %}

Una llave foránea es una campo que referencia a una llave primaria en otra tabla o la misma

```sql
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
```

la llave foránea se puede codificar de la siguiente forma

```sql
constraint pk_estudiante primary key (tipo_documento, numero_documento)
```

