/*Ejercicio: Willie Dixon
En el salón de Musimundos tenemos un cliente fanático de Willie Dixon, quiere comprar toda la colección de sus temas,
pero no le interesan los temas que sean de su etapa en el rock.

Hagamos una consulta en la base de datos donde muestre todos los registros que contengan
canciones con sus géneros, Y que el compositor sea Willie Dixon, Y que tengan el género Blues.
Pretty Baby
Ingresá el nombre de la segunda canción que obtuviste.*/
SELECT canciones.id,canciones.id_album,generos.nombre as nombre_genero,canciones.nombre as canciones_Dixon
FROM canciones
JOIN generos on canciones.id_genero = generos.id
WHERE canciones.compositor = "Willie Dixon" and generos.nombre = "Blues"
limit 1 offset 1;


/*Ejercicio: Rock nacional
Es la semana del rock a nivel mundial, y nuestro gerente de Musimundos nos pide 
crear anuncios con canciones del género Rock.

Hacé una consulta a nuestra base de datos que nos devuelva 
los nombres de las canciones que tengan género rock.
Restless and Wild
Ingresá de la cancion que aparece en el cuarto lugar. */
SELECT canciones.nombre as Canciones_genero_Rock
FROM canciones
JOIN generos on canciones.id_genero = generos.id
WHERE generos.nombre = "Rock"
limit 1 offset 3;



/*Ejercicio: Deep Purple
En el salón de Musimundos hay un cliente fanático de Deep Purple, 
este quiere comprar todos los álbumes que tengan como artista a Deep Purple. 
Hacé una consulta a nuestra base de datos que nos traiga el título del álbum y el autor, 
para saber si lo que le estamos vendiendo es correcto.
Stormbringer
Ingresá el título del álbum en la posición número 10. */
SELECT artistas.nombre as Autor, albumes.titulo as Titulo_Album
FROM artistas
JOIN albumes ON albumes.id_artista = artistas.id
WHERE artistas.nombre = "Deep Purple"
limit 1 offset 9;



/*Ejercicio: MPEG
En el departamento de desarrollo de Musimundos están creando la nueva aplicación mobile, 
en la cual vas a poder escuchar musica online de tus artistas favoritos. 
Para evitar posibles problemas de compatibilidad, los desarrolladores decidieron que sólo van a subir 
canciones que tengan el tipo de medio "MPEG audio file". 
Ayudá al equipo y obtengamos una lista en las cuales tengas el nombre de las canciones que tengan ese tipo de medio.
Inject The Venom
Ingresá el nombre que figura en la posición número 4. */
SELECT canciones.nombre as Nombre_Cancion,tipos_de_medio.nombre as tipo_medio 
FROM canciones
JOIN tipos_de_medio ON tipos_de_medio.id = canciones.id_tipo_de_medio
WHERE tipos_de_medio.nombre = "MPEG audio file"
limit 1 offset 3;

