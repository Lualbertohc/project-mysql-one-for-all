SELECT 
u.nome AS usuario,
COUNT(h.musica_id) AS qt_de_musicas_ouvidas,
ROUND(SUM(m.duracao_segundos) / 60, 2) AS total_minutos 
FROM SpotifyClone.usuarios AS u
INNER JOIN SpotifyClone.historico_de_reproducoes AS h 
ON h.usuario_id = u.usuario_id
INNER JOIN SpotifyClone.musicas AS m
ON m.musica_id = h.musica_id
GROUP BY usuario ORDER BY usuario;