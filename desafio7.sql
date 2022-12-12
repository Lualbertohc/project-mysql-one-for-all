SELECT 
artista.nome AS artista,
album.titulo AS album,
COUNT(seguidores.usuario_id) AS seguidores
FROM SpotifyClone.artistas AS artista
INNER JOIN SpotifyClone.albuns AS album
ON artista.artista_id = album.artista_id
INNER JOIN SpotifyClone.lista_de_seguidores AS seguidores
ON artista.artista_id = seguidores.artista_id
GROUP BY artista, album ORDER BY seguidores DESC, artista, album;