SELECT a.album_name AS album, COUNT(f.song_id) AS favoritadas
FROM SpotifyClone.favorites AS f
JOIN SpotifyClone.songs AS s ON f.song_id = s.song_id
JOIN SpotifyClone.albums AS a ON s.album_id = a.album_id
GROUP BY a.album_id
ORDER BY favoritadas DESC, album ASC
LIMIT 3;
