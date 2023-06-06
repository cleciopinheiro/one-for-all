SELECT s.song_name AS cancao, COUNT(*) AS reproducoes
FROM SpotifyClone.songs s
JOIN SpotifyClone.history h ON s.song_id = h.song_id
GROUP BY s.song_id
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;
