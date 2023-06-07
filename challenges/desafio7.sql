SELECT a.artist_name AS artista, al.album_name AS album, COUNT(f.user_id) AS pessoas_seguidoras
FROM SpotifyClone.artists AS a
JOIN SpotifyClone.albums AS al ON a.artist_id = al.artist_id
LEFT JOIN SpotifyClone.follows AS f ON a.artist_id = f.artist_id
GROUP BY a.artist_id, al.album_id
ORDER BY pessoas_seguidoras DESC, artista ASC, album ASC;
