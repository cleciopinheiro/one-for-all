SELECT
   artists.artist_name AS artista,
  CASE
    WHEN COUNT(fs.song_id) >= 5 THEN 'A'
    WHEN COUNT(fs.song_id) >= 3 AND COUNT(fs.song_id) <= 4 THEN 'B'
    WHEN COUNT(fs.song_id) >= 1 AND COUNT(fs.song_id) <= 2 THEN 'C'
    ELSE '-'
  END AS ranking
FROM
  SpotifyClone.artists
LEFT JOIN
  SpotifyClone.albums ON artists.artist_id = albums.artist_id
LEFT JOIN
  SpotifyClone.songs ON albums.album_id = songs.album_id
LEFT JOIN
  SpotifyClone.favorites AS fs ON songs.song_id = fs.song_id
GROUP BY
  artists.artist_name
ORDER BY
  COUNT(fs.song_id) DESC,
  artists.artist_name ASC;