# Relaciones

## Relaciones identificables\( **IDENTIFYING\)**

Su representación gráfica es una línea sólida entre dos entidades.

> **Definición según los docs de mySQL:** Una relación IDENTIFICATIVA es una en la que la tabla hija no puede tener identificadores únicos sin su tabla padre. Generalmente sucede cuando una tabla intermedia es creada para resolver una relación many-to-many. En dichos casos, la clave primaria se compone a partir de las claves primarias de las dos tablas originales.

Ejemplo: Podríamos tener cliente que tengan el mismo  numero de documento pero diferente tipos de documento.

![](../../../.gitbook/assets/image%20%284%29.png)

## Relaciones No identificables \(**NON-IDENTIFYING\)**

Su representación gráfica es una línea punteada entre dos entidades.

> **Definición:** Una relación no-identificativa es una donde el "hijo" puede ser identificado independientemente del "padre".

Ejemplo: En la tabla cliente no se pueden tener dos cliente o mas con el mismo numero de documento sin importar lo que tenga la sigla.

![](../../../.gitbook/assets/image%20%2810%29.png)

