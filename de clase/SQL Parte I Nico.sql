/*Ejercicio: ¿Qué albumes tenemos?
 Viene el manager de Musimundos y, para organizar su inventario de discos, te pide un informe con 
 todos los albumes que posee la empresa. 
 
 Realizá una consulta que devuelva todos los álbumes.
Big Ones
Ingresá -de la columna título- el nombre del álbum que aparece quinto. */
SELECT titulo
FROM albumes;




/*Ejercicio: Control de ventas
Para realizar un control de ventas, Musimundos te pide consultar 
el primer nombre y teléfono de todos sus clientes.
+49 0711 2842222, Leonie
Insertá el número de teléfono del segundo cliente que obtuviste. */
SELECT primer_nombre, telefono
FROM clientes
limit 1 offset 1;


/*Ejercicio: Clientes de Estados Unidos
Ahora que ya tenemos los nombres de los clientes necesitamos que obtengas sólo aquellos que sean de USA.
Michelle
Insertá el nombre del tercer cliente que obtuviste. */
SELECT primer_nombre
FROM clientes
WHERE pais= "USA"
limit 1 offset 2;

/*Ejercicio: Canciones semi-largas
Vamos a ponernos un poco más finos con la selección. 
El departamento de canciones te pide un informe de aquellas 
cuya duración sea entre 200.000 y 300.000 milisegundos. ¿Te animás?
Inject The Venom
Insertá el nombre de la quinta canción que obtuviste. */
SELECT nombre
FROM canciones
WHERE milisegundos BETWEEN 200000 and 300000
limit 1 offset 4;


/*Ejercicio: Clientes hispanohablantes
URGENTE! Una banda argentina acaba de sacar un álbum, y nos pidio una lista de clientes hispanohablantes 
para poder divulgar su producto. 
Te pedimos que obtengas una lista de clientes cuyo país de origen sea Spain o Argentina. 
¡Suerte con eso! 
Enrique
Insertá el nombre del primer cliente que hayas obtenido. */
SELECT primer_nombre,pais
FROM clientes
WHERE pais= "Argentina" OR pais="Spain"
limit 1;

/*Ejercicio: Todos los géneros de los álbumes
Musimundos desea agregar una lista con todos los géneros a los que pertenecen sus álbumes,
pero ordenados por nombre de manera alfabética.
Blues
Insertá el nombre del tercer género que hayas obtenido. */
SELECT  *
FROM generos
ORDER BY nombre ASC
limit 1 offset 2;



/*Ejercicio: Nombres de clientes ordenados.
Los gerentes están muy satisfechos con tu trabajo! Pero las tareas todavía no terminan.
Ahora necesitan una lista con solamente los nombres de los clientes de Musimundos,
 ordenada por país de origen (descendente) y, como segundo parámetro, por ciudad. 
¿Estás listo?
Frank
Insertá el nombre del sexto cliente que hayas obtenido. */
SELECT primer_nombre,pais,ciudad
FROM clientes
ORDER BY pais DESC , ciudad
limit 1 offset 5;



/*Ejercicio: Top 3
El encargado del equipo de UX de Musimundos necesita hacer una presentación mostrando
solo tres canciones de nuestra colección. Además, pide que sean las tres con mayor duración.
¡Vamos con eso! 
227,229,253
Insertá el ID del Album de las tres canciones que obtuviste, en orden, sin espacios y separados por coma.  */
SELECT nombre, id_album,milisegundos
FROM canciones
ORDER BY milisegundos desc
LIMIT 3;



/*Ejercicio: Paginación
Tenemos un nuevo comunicado del departamento de UX.
En esta ocación necesitan hacer una paginación de canciones. 
La primer página ya está resuelta, pero para la segunda debés saltear cinco canciones 
y traer las próximas cinco. Estas deben estar ordenadas alfabéticamente por nombre. 
Miles Davis
Insertá el compositor de la quinta canción que obtuviste.  */
SELECT nombre,compositor
FROM canciones
ORDER BY nombre
limit 1 offset 4;


/*Ejercicio: Compositores con A
Utilizemos el nuevo operador LIKE.
Musimundos te pide un listado de todas las canciones cuyos compositores empiecen con "A". ¿Te parece fácil? 
Inject The Venom

Insertá el nombre de la cuarta canción que obtuviste. */
SELECT canciones.nombre
FROM canciones
WHERE compositor LIKE 'A%';


/*Ejercicio: Lista especial de géneros.
Ahora, Musimundos sube la apuesta, y necesita un listado de géneros
 que contengan en alguna parte del nombre la sigla "ro".
Rock And Roll
Insertá el nombre del último género que obtuviste.
Tip: No te preocupes por las mayúsculas y minúsculas ya que el LIKE no hace distinción entre las mismas. */
SELECT generos.nombre
FROM generos
WHERE nombre like "ro%"
limit 1 offset 1;

/*Ejercicio: Selección de canciones
Ayer hablé con tu gerente y está muy contento con el trabajo que venís realizando. ¡Felicitaciones!

Únicamente me pidió, antes de despedirnos, que te comunicara una última tarea. 
En Musimundos necestan hacer un chequeo de canciones y solicitan una lista de las 
que tengan un id entre 10 y 20. ¿Podrías encargarte?
C.O.D.
Ingresá el nombre de la segunda canción que hayas obtenido. */
SELECT id,nombre
FROM canciones
WHERE id between 10 and 20;



/*Ejercicio: Tipos de medio
Decidimos que "nombre" era un poco ambigüo para una columna de tipos de medios. 
Por eso, Musimundos te pide una lista de los nombres de tipos de medio
en una columna que se llame "nombres_de_medios".
MPEG audio file
Insertá el primer nombre de medio que obtuviste. */

SELECT distinct nombre as "nombres_de_medios"
FROM tipos_de_medio;




