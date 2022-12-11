SELECT
COUNT(DISTINCT m.musica) AS cancoes,
COUNT(DISTINCT a.artista_id) AS artistas,
COUNT(DISTINCT a.titulo) AS albuns
FROM SpotifyClone.musicas AS m
INNER JOIN SpotifyClone.albuns AS a;