
/*Ejercicio: Empleados
Desde el sector de recursos humanos de Musimundos nos están solicitando una lista de todos 
los cargos que tienen los empleados, hacé una consulta a nuestra base de datos que nos brinde
el título de los cargos que tengan todos los empleados sin repetirse.
IT Manager
Ingresá el título que figura en la posición 4. */
SELECT distinct titulo
FROM empleados;


/*Ejercicio: Ranking Canciones
Desde el departamento de desarrollo de Musimundos están preparando el ranking de las canciones favoritas del público.

Para ello, te piden que le pasemos el nombre de todas las canciones que están en una playlist,
 y el nombre de la playlist a la que pertenecen.
Ojo! Tengamos cuidado de no repetir el nombre de las canciones. 

Para esta consulta vamos a tener que usar información de las tablas canciones, canciones_de_playlists y playlists.
Princess of the Dawn
Ingresá el título que figura en la quinta posición.*/
SELECT canciones.nombre, playlists.nombre AS nombre_playlist
FROM canciones
JOIN canciones_de_playlists ON canciones.id = canciones_de_playlists.id_cancion
JOIN playlists ON canciones_de_playlists.id_playlist = playlists.id
WHERE playlists.nombre = 'Heavy Metal Classic';



/*Ejercicio: Ranking Canciones 2
Desde el departamento de desarrollo de Musimundos están preparando la parte de la aplicación
 en la cual accedemos a una canción en particular. Nos comentan que debajo de la imagen de la canción 
 deberá aparecer un texto específico, y necesitan nuestra ayuda. 
 El texto tiene que ser:

"La canción " (nombre del tema) " fue compuesta por " (compositor del tema).

Hacé una consulta a nuestra base de datos que nos traiga el nombre y el compositor
de cada tema, sin repeticiones y agregando el texto que el equipo de desarrollo nos mencionaba.
Ojo! Tené en cuenta los espacios dentro de los textos que nos pidieron añadir.

Ingresá el primer resultado que obtuviste, sin comillas.
Tip: Respetar espacios del string pedido */
SELECT CONCAT('La canción "', canciones.nombre, '" fue compuesta por "', artistas.nombre, '".') 
FROM canciones
JOIN artistas ON canciones.compositor = artistas.id
GROUP BY canciones.nombre, artistas.nombre;


/*Ejercicio: Facturas
En el departamento de Finanzas de Musimundos quieren separar las facturas dependiendo del 
origen de las mismas, pero les dicen que encuentran que hay algunas columnas con resultados nulos.

Hacé una consulta a la base de datos que nos traiga la primer columna no nula 
que encuentre entre las columnas estado_o_provincia_de_facturacion, pais_de_facturacion y codigo_postal_de_facturacion.
Germany
Ingresá el primer resultado que obtuviste.*/
SELECT COALESCE(estado_o_provincia_de_facturacion, pais_de_facturacion, codigo_postal_de_facturacion) AS primera_columna_no_nula
FROM facturas
WHERE estado_o_provincia_de_facturacion IS NOT NULL 
   OR pais_de_facturacion IS NOT NULL 
   OR codigo_postal_de_facturacion IS NOT NULL
;



/*Ejercicio: Edad empleados
En el departamento de Recursos Humanos de Musimundos quieren saber la edad de los empleados 
al momento que empezaron a trabajar en la empresa.

Hacé una consulta la base de datos que traiga la diferencia entre su fecha de nacimiento y 
la fecha de contratación.

Ingresá la tercer diferencia que obtuviste.27

TIP: Recordá que DATEDIFF() retorna la diferencia entre las fechas expresada en DÍAS. 
Teniendo esto en cuenta y sabiendo que un año pretende tener 365, cómo realizarías la consulta?
Para darte una ayuda, te presentamos la funcion FLOOR(), que redondea cualquier número con decimales hacia abajo. */
SELECT FLOOR(DATEDIFF(fecha_de_contratacion, fecha_nacimiento) / 365) AS edad_contratacion
FROM empleados;



/*Ejercicio: Última factura
En la aplicación de Musimundos, un usuario está revisando sus últimas facturas y
 quiere saber en qué mes fue su última factura.

Hacé una consulta a la base de datos que traiga todas las facturas del cliente número 2
ordenadas por su fecha y extrae el mes de la misma.
12
Ingresá el número de mes de la última factura. */

SELECT MONTH(fecha_factura) AS numero_mes
FROM facturas
WHERE id_cliente = 2
ORDER BY fecha_factura DESC
LIMIT 1;
 
 /* Ejercicio: Clientes de Brasil
El área de estrategia de Musimundos está analizando cómo implementar una acción de marketing,
 en la cual tiene que destinar un presupuesto acorde a la cantidad de clientes que tenga cada país.

Por esto te piden que los ayudemos a identificar la cantidad de clientes que son de Brazil. 
Generemos una consulta en nuestra base de datos que nos traiga la cuenta de todos los clientes que son de Brazil.
5
Ingresá el número que te dio como resultado. */
SELECT COUNT(*) AS cantidad_clientes_brasil
FROM clientes
WHERE pais = 'Brazil';

/* Ejercicio: Canciones por género
En Musimundos estamos muy atentos a que nuestros usuarios encuentren una cantidad apropiada
de canciones del estilo que quieran escuchar. Es por eso que en esta oportunidad nos están 
solicitando una lista de cuantas canciones tenemos por género.

Hacé una consulta a la base de datos que traiga el nombre del género y la cantidad de canciones que posee.
81
Ingresá el número que te dio como resultado en las canciones del género Blues. */

SELECT generos.nombre AS nombre_genero, COUNT(*) AS cantidad_canciones
FROM canciones
JOIN generos ON canciones.id_genero = generos.id
GROUP BY generos.nombre;


/* Ejercicio: Balance comercial
Es época de balances, y en Musimundos queremos saber cuánto dinero
llevan gastados los clientes en nuestra empresa.

Hacé una consulta a nuestra base de datos que sume el total de todas 
las facturas que emitió la empresa.
2328.60
Insertá el número que obtuviste.*/
SELECT SUM(total) AS total_gastado
FROM facturas;

/*Ejercicio: Duración de los albumes
En el sitio web de Musimundos, queremos mejorar nuestras vistas de productos colocando el 
promedio de duración de cada álbum al pie de cada álbum.

Tomemos como ejemplo a la banda AC/DC y consulta a la base de datos el álbum 'Let There Be Rock'. 
Obtené una lista de sus canciones con su duración. 
306657.3750
Saca un promedio de duración de las mismas. 

Insertá el número del promedio que obtuviste. */
SELECT AVG(canciones.milisegundos) AS PromedioDuracion
FROM canciones
JOIN albumes ON canciones.id_album = albumes.id
JOIN artistas ON albumes.id_artista = artistas.id
WHERE albumes.titulo = "Let There Be Rock";





/* Ejercicio: Moviendo archivos
En el equipo de desarrollo están mudando de servidor a nuestra aplicación, 
y quieren saber cuál es el peso de cada archivo de canciones para buscar un servidor adecuado con capacidad suficiente.

Hace una consulta a la base de datos para saber cuál es el archivo con menor peso en bytes.
38747
Insertá el número que obtuviste. */
SELECT min(bytes)
FROM canciones
ORDER BY bytes asc
LIMIT 1;


/*Ejercicio: Descuento
En el salón de Musimundos, estamos ofreciendo una promoción para los clientes regulares
donde regalamos un 20% de descuento en su compra si alguna vez el cliente hizo una compra con un total de más de 12.
El cliente número 48 acaba de entrar por la puerta y el vendedor quiere corroborar si el descuento se aplica.

Hacé una consulta a la base de datos que nos traiga el total de la factura más cara que tenga el cliente número 48.
13.86
Insertá el número que obtuviste. */
SELECT MAX(total) AS TotalFacturaMasCara
FROM facturas
WHERE id_cliente = 48;


/* Ejercicio: Variedad Musical
En Musimundos estamos preparando los próximos afiches en la vía pública y queremos lanzar una campaña
donde demostremos que nuestra plataformas la variedad de música tenemos.

Hacé una consulta a nuestra base datos que muestre cuántas canciones tenemos, agrupadas por el nombre del género.

Ingresá el nombre del género del cual tenemos 130 canciones.

Tip: vas a necesitar información de más de 1 tabla. */
SELECT generos.nombre, COUNT(*) AS CantidadCanciones
FROM canciones
JOIN generos ON canciones.id_genero = generos.id
GROUP BY generos.nombre
HAVING CantidadCanciones = 130;


/*Ejercicio: Álbumes largos
En el área de desarrollo de Musimundo están creando una nueva funcionalidad del buscador avanzado. 
Este buscador tiene muchísimas opciones de filtrado, incluso puede buscar álbumes que tengan por lo menos
cierta cantidad de minutos.

Hacé una consulta a la base de datos que traiga el título del álbum y la suma de los milisegundos 
de las canciones que lo componen. 
Probemos traer los álbumes cuyas canciones sean del género Blues, agrupadas por álbum 
y que la suma de su duración sea más de 3000000 milisegundos.

Ingresá el título del primer álbum.
The Cream Of Clapton
Tip: piensen bien de qué tablas necesitan sacar cada campo que necesita la consulta.*/
SELECT albumes.titulo AS TituloAlbum, SUM(canciones.milisegundos) AS SumaDuracion,generos.nombre
FROM canciones
JOIN albumes ON albumes.id = canciones.id_album
JOIN generos ON canciones.id_genero = generos.id
WHERE generos.nombre = 'Blues'
GROUP BY albumes.titulo
HAVING SumaDuracion > 3000000;



/*Ejercicio: Beneficios
Desde el departamento de fidelización de clientes de Musimundos vamos a sacar al mercado una campaña
la cual implica que nuestros clientes van a tener un título que les otorgara beneficios a la hora de realizar compras.

Para esto necesitamos crear una nueva tabla en nuestra base de datos. 
El nombre de la tabla será tipo_cliente y dentro tendrá dos columnas, 
la primera llamada id_tipo_cliente siendo un int(6) primary key not null. 
Y el segundo campo llamado titulo sera varchar(20) y not null.

Ingresá la consulta que creaste.

Tip: Escribila en mayúscula */
CREATE TABLE tipo_cliente ( id_tipo_cliente INT(6) PRIMARY KEY NOT NULL, titulo VARCHAR(20) NOT NULL);


/*Ejercicio: Fe de erratas
Al crear la tabla tipo_cliente, el equipo de fidelización no tuvo en cuenta que cada tipo de cliente
 debe tener una cantidad de descuento asignada. Vos pasas cerca del equipo y te preguntan si sabes algo de MySQL.

Hagamos una query que altere la tabla tipo_cliente, agregando la columna porcentaje_descuento y que sea TINYINT UNSIGNED.

Escribí tu query en mayúscula.*/

ALTER TABLE tipo_cliente
ADD COLUMN porcentaje_descuento TINYINT UNSIGNED;

/*Ejercicio: Nuevos géneros de música
Desde el sector comercial de Musimundos nos informan que van a añadir un nuevo género de música a nuestra plataforma. 
Necesitan que les ayudemos a cargarlo en nuestra base de datos.

Insertemos en la tabla generos el id 26 y el nombre Cumbia.

Insertá tu query en mayúsculas.*/
INSERT INTO generos (id, nombre) VALUES (26, 'Cumbia');

