select * from usuario;
select * from categoria;
select * from publicacion;
select * from comentario;
select * from seguir;

use ragequit;

insert into categoria(id, descripcion, nombre, tipoCategoria, urlIcono, urlImagen)
value(1, "Un juego re lindo1", "Paladins", 0, "img/categoriaIcon/paladinsIcon.png", "https://static-cdn.jtvnw.net/ttv-boxart/Paladins-144x192.jpg"),
(2, "Un juego re lindo2", "UWU", 1,"img/categoriaIcon/uwuIcon.png","https://wallpaperaccess.com/full/2108555.jpg"),
(3, "Un juego re lindo3", "LoL", 0,"img/categoriaIcon/leagueOfLegendsIcon.png", "https://static-cdn.jtvnw.net/ttv-boxart/League%20of%20Legends-144x192.jpg"),
(4, "Un juego re lindo4", "Musica", 1,"img/categoriaIcon/musicIcon.png","https://static-cdn.jtvnw.net/ttv-boxart/Music-285x380.jpg") ,
(5, "Un juego re lindo5", "Minecraft", 0,"img/categoriaIcon/minecraftIcon.png", "https://static-cdn.jtvnw.net/ttv-boxart/Minecraft-144x192.jpg"),
(6, "Un juego re lindo6", "Smite",0, "img/categoriaIcon/smiteIcon.png", "https://static-cdn.jtvnw.net/ttv-boxart/SMITE-144x192.jpg"),
(7, "Un juego re lindo7", "DOTA2",0, "img/categoriaIcon/DOTA2Icon.png", "https://static-cdn.jtvnw.net/ttv-boxart/Dota%202-144x192.jpg"),
(8, "Un juego re lindo8", "FreeFire",0, "img/categoriaIcon/freeFireIcon.png", "https://static-cdn.jtvnw.net/ttv-boxart/Garena%20Free%20Fire-144x192.jpg"),
(9, "Un juego re lindo9", "Among Us",0, "img/categoriaIcon/amongUsIcon.png", "https://static-cdn.jtvnw.net/ttv-boxart/Among%20Us-144x192.jpg"),
(10, "Un juego re lindo10", "Sector's Edge",0, "img/categoriaIcon/sectorEdgeIcon.png", "https://static-cdn.jtvnw.net/ttv-boxart/Sector%27s%20Edge-144x192.jpg"),
(11, "Un juego re lindo11", "Old School RuneScape",0, "img/categoriaIcon/oldSchoolRunEscapeIcon.png", "https://static-cdn.jtvnw.net/ttv-boxart/Old%20School%20RuneScape-144x192.jpg"),
(12, "Un juego re lindo12", "Mario Bros",0, "img/categoriaIcon/marioBrosIcon.png", "https://static-cdn.jtvnw.net/ttv-boxart/Super%20Mario%20Bros.-144x192.jpg"),
(13, "Un juego re lindo13", "Zelda",0, "img/categoriaIcon/zeldaIcon.png", "https://static-cdn.jtvnw.net/ttv-boxart/./The%20Legend%20of%20Zelda:%20Breath%20of%20the%20Wild-144x192.jpg"),
(14, "Un juego re lindo14", "Sonic",0, "img/categoriaIcon/sonicIcon.png", "https://static-cdn.jtvnw.net/ttv-boxart/Sonic%20the%20Hedgehog-144x192.jpg");
;


insert into usuario(id, apellido, email, nombre, nombreUsuario, password, rol, url_imagen,contadorSeguidores,contadorSeguidos)
value(1, "Sanchez", "matias@email.com", "Matias", "Pewmafe", "123", "admin", "img/imgUsuario/matias.jpeg",0,0),
(2, "Fagliano", "santi@email.com", "Santiago", "ElSanti", "123", "admin", "img/imgUsuario/santiago.jpeg",0,0),
(3, "Fiora", "fiore@email.com", "Fiore", "LadyFio", "123", "usuario", "img/imgUsuario/fio.jpeg",0,0),
(4, "ElRey", "franco@email.com", "Franco", "Furanko", "123", "usuario", "img/imgUsuario/franco.jpeg",0,0),
(5, "Abi", "abril@email.com", "Abril", "Abi", "123", "admin", "img/imgUsuario/abril.jpeg",0,0);



insert into publicacion(id, cantidadComentarios, cantidadLikes, estado, fechaHora, mensaje, categoria_id, usuario_id)
value(1, 0, 0, 0, 20200512,"Aguante LoL ", 3, 4),
(2, 0, 0, 0, 20200516,"UwU de los UwUs", 2, 3),
(3, 0, 0, 0, 20200517,"sale maincra?", 14, 1),
(4, 0, 0, 0, 20200614,"Soy el mejor Zeus", 6, 2),
(5, 0, 0, 0, 20200801,"Estoy chikita", 4, 5);



