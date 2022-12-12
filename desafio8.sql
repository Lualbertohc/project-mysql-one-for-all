SELECT 
artista.nome AS artista,
album.titulo AS album
FROM SpotifyClone.artistas AS artista
INNER JOIN SpotifyClone.albuns AS album
ON artista.artista_id = album.artista_id
WHERE artista.nome = "Elis Regina";