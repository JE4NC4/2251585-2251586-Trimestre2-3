# Diseño de bases de datos

## Modelo Relacional

{% embed url="https://es.wikipedia.org/wiki/Modelo\_relacional" %}

Carro{ marca, precio, modelo, puestos, matricula\#, cilindraje, color }

Televisor { serial, marca, tamaño } 

     pk {serial}

### Entidad \(tabla\)

Una entidad es una cosa u objeto, Un objeto es una unidad dentro de un programa de computadora que consta de un estado y de un comportamiento, que a su vez constan respectivamente de datos almacenados del mundo real, también puede ser un concepto abstracto y es distinguible de todos los demás objetos. Una entidad tiene un conjunto de propiedades o atributos que la caracterizan.

Ejemplos: Carro, televisión.

### Atributos \(campos, columnas\)

Son características que tiene las entidades que necesitamos para el negocio.

Ejemplos: de un carro el **color, la marca, modelo**, etc

### Tupla \( registro, fila \)

Corresponde a una fila de una tabla o una registro de una relación.

### Relación 

Se puede dar entre dos entidades para solucionar un problema especifico.

### Llave primaria 

Es un campo o varios campos que permite que mi registro sea único.

### Llave candidata

Son los atributos que se pueden considerara llaves primarias pero al estas en la fase de selección en el modelo relacional no se ha determinado si lo son.

### Llave alternativa

una llave candidata que no paso a ser llave primaria, que puede afectar el negocio.

## Modelo Entidad Relación

Es unas de las representaciones graficas del modelo relacional.

